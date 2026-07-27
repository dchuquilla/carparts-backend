class SecurityHeadersMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)

    # Prevent clickjacking
    headers['X-Frame-Options'] = 'DENY'

    # Prevent MIME type sniffing
    headers['X-Content-Type-Options'] = 'nosniff'

    # Enforce HTTPS
    headers['Strict-Transport-Security'] = 'max-age=31536000; includeSubDomains'

    # Prevent XSS attacks
    headers['X-XSS-Protection'] = '1; mode=block'

    # Content Security Policy
    headers['Content-Security-Policy'] = "default-src 'self'; script-src 'self' 'unsafe-inline'; style-src 'self' 'unsafe-inline'; img-src 'self' data: https:"

    # Referrer Policy
    headers['Referrer-Policy'] = 'strict-origin-when-cross-origin'

    # Permissions Policy (Feature Policy)
    headers['Permissions-Policy'] = 'geolocation=(), microphone=(), camera=()'

    [status, headers, body]
  end
end
