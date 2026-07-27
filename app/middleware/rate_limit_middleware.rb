class RateLimitMiddleware
  MAX_REQUESTS_PER_WINDOW = 100
  WINDOW_SIZE_SECONDS = 300
  BLOCK_DURATION_SECONDS = 3600

  def initialize(app)
    @app = app
    @request_counts = {}
    @blocked_ips = {}
  end

  def call(env)
    client_ip = extract_client_ip(env)
    path = env['PATH_INFO']

    # Check if IP is blocked
    if blocked?(client_ip)
      return rate_limited_response
    end

    # Skip rate limiting for health checks
    if health_check_path?(path)
      return @app.call(env)
    end

    # Track request
    if should_rate_limit?(client_ip)
      block_ip(client_ip)
      Rails.logger.warn("IP #{client_ip} rate limited after scanning behavior")
      return rate_limited_response
    end

    increment_request_count(client_ip)
    status, headers, body = @app.call(env)

    # Log suspicious paths
    if suspicious_path?(path) && status == 404
      log_suspicious_request(client_ip, path, env)
    end

    [status, headers, body]
  end

  private

  def extract_client_ip(env)
    forwarded = env['HTTP_X_FORWARDED_FOR']
    if forwarded.present?
      forwarded.split(',').first.strip
    else
      env['REMOTE_ADDR']
    end
  end

  def health_check_path?(path)
    path == '/' || path.start_with?('/health')
  end

  def suspicious_path?(path)
    suspicious_patterns = [
      /\.php$/,
      /\/wp-/,
      /\/admin\//,
      /\.\.\//,
      /\.\.%/,
      /union.*select/i,
      /drop.*table/i,
      /insert.*into/i,
      /exec\(/i,
      /system\(/i,
      /base64_decode/
    ]

    suspicious_patterns.any? { |pattern| path.match?(pattern) }
  end

  def should_rate_limit?(client_ip)
    return true if blocked?(client_ip)

    current_time = Time.now.to_i
    key = client_ip
    count = @request_counts[key] || []

    # Remove old entries
    count.reject! { |timestamp| current_time - timestamp > WINDOW_SIZE_SECONDS }

    # Count 404s in current window (scanning behavior indicator)
    count >= MAX_REQUESTS_PER_WINDOW
  end

  def increment_request_count(client_ip)
    current_time = Time.now.to_i
    key = client_ip

    @request_counts[key] ||= []
    @request_counts[key] << current_time
    @request_counts[key].reject! { |timestamp| current_time - timestamp > WINDOW_SIZE_SECONDS }
  end

  def blocked?(client_ip)
    return false unless @blocked_ips[client_ip]

    if Time.now.to_i - @blocked_ips[client_ip] > BLOCK_DURATION_SECONDS
      @blocked_ips.delete(client_ip)
      false
    else
      true
    end
  end

  def block_ip(client_ip)
    @blocked_ips[client_ip] = Time.now.to_i
  end

  def log_suspicious_request(client_ip, path, env)
    Rails.logger.warn(
      "Suspicious request detected: IP=#{client_ip}, " \
      "Path=#{path}, " \
      "User-Agent=#{env['HTTP_USER_AGENT']}"
    )
  end

  def rate_limited_response
    body = { error: 'Too many requests' }.to_json
    headers = {
      'Content-Type' => 'application/json',
      'Retry-After' => '3600'
    }
    [429, headers, [body]]
  end
end
