# Security Implementation Guide

This guide explains the security patterns implemented and how to configure them.

## 1. Webhook Signature Verification (OpenWa)

### What It Does
Verifies that webhook requests from OpenWa are authentic using HMAC-SHA256 signatures. This prevents malicious actors from sending fake webhook events.

### Setup Steps

#### Step 1: Generate a Webhook Secret
Generate a strong random secret (at least 32 characters):

```bash
# Generate using Ruby
ruby -e "puts SecureRandom.hex(32)"

# Or using OpenSSL
openssl rand -hex 32
```

Example output: `<your-generated-secret>`

#### Step 2: Add Secret to Rails Credentials

Edit your credentials file:
```bash
bin/rails credentials:edit
```

Add:
```yaml
openwa_webhook_secret: "<your-generated-secret>"
```

For environment-specific credentials (production):
```bash
bin/rails credentials:edit --environment production
```

#### Step 3: Configure OpenWa Webhook

In your OpenWa installation, configure the webhook with:

**Webhook URL:**
```
https://api.quientiene.com/api/v1/webhooks/openwa
```

**Headers:**
Add a custom header for the signature. OpenWa should send:

```
X-Webhook-Signature: <HMAC-SHA256 signature>
```

**How OpenWa calculates the signature:**
```javascript
// In your OpenWa webhook configuration
const crypto = require('crypto');
const secret = "<your-generated-secret>"; // Same as in Rails

// When sending webhook, include this header:
const payload = `${sessionId}|${event}|${timestamp}`;
const signature = crypto
  .createHmac('sha256', secret)
  .update(payload)
  .digest('hex');

headers['X-Webhook-Signature'] = signature;
```

**Alternatively (if OpenWa doesn't support custom headers):**
OpenWa can send the signature as a query parameter:
```
https://api.quientiene.com/api/v1/webhooks/openwa?signature=<HMAC-SHA256>
```

#### Step 4: Test the Webhook

Test with curl:
```bash
SESSION_ID="<your-session-id>"
EVENT="message.received"
TIMESTAMP="2026-07-27T16:21:24.804Z"
SECRET="<your-generated-secret>"

# Calculate signature
PAYLOAD="${SESSION_ID}|${EVENT}|${TIMESTAMP}"
SIGNATURE=$(echo -n "$PAYLOAD" | openssl dgst -sha256 -hmac "$SECRET" -hex | awk '{print $2}')

# Send test webhook
curl -X POST https://api.quientiene.com/api/v1/webhooks/openwa \
  -H "X-Webhook-Signature: $SIGNATURE" \
  -H "Content-Type: application/json" \
  -d '{
    "sessionId": "'$SESSION_ID'",
    "event": "'$EVENT'",
    "timestamp": "'$TIMESTAMP'",
    "data": {
      "from": "<your-phone-number>@lid",
      "body": "Test message"
    }
  }'
```

---

## 2. Rate Limiting

### What It Does
- Limits requests to 100 per 5 minutes per IP address
- Blocks IPs showing scanning behavior (multiple 404s)
- Automatic unblock after 1 hour
- Excludes health checks from limits

### Configuration

Edit `app/middleware/rate_limit_middleware.rb` to adjust:

```ruby
MAX_REQUESTS_PER_WINDOW = 100  # Change this value
WINDOW_SIZE_SECONDS = 300      # 5 minutes
BLOCK_DURATION_SECONDS = 3600  # 1 hour
```

### Monitoring

Check logs for rate limited IPs:
```bash
# View in production logs
grep "rate limited" log/production.log
grep "Suspicious request detected" log/production.log
```

---

## 3. Security Headers

### What It Does
Adds HTTP security headers to all responses:

- **X-Frame-Options**: DENY - Prevents clickjacking attacks
- **X-Content-Type-Options**: nosniff - Prevents MIME type sniffing
- **Strict-Transport-Security**: Enforces HTTPS
- **X-XSS-Protection**: Prevents reflected XSS attacks
- **Content-Security-Policy**: Restricts resource sources
- **Referrer-Policy**: Controls referrer information
- **Permissions-Policy**: Disables potentially dangerous browser features

### Customization

Edit `app/middleware/security_headers_middleware.rb` to customize headers for your needs.

---

## 4. Suspicious Path Blocking

### What It Does
Detects and logs requests to common attack vectors:
- PHP shell filenames (*.php)
- WordPress directories (/wp-*)
- Directory traversal attempts (../, ..%)
- SQL injection patterns
- Command execution attempts

### Monitoring

Suspicious requests are logged with:
```
Suspicious request detected: IP=172.69.9.30, Path=/wp-rss2.php, User-Agent=...
```

Check production logs:
```bash
grep "Suspicious request detected" log/production.log
```

---

## 5. Security Best Practices

### Environment Variables Checklist

Ensure these are set in production:

```bash
# Credentials to set via bin/rails credentials:edit
openwa_url: https://wa.quientiene.com
openwa_token: your-openwa-token
openwa_webhook_secret: your-generated-secret  # Generated in Step 1
deepseek_base_url: https://api.deepseek.com/v1
deepseek_api_key: your-deepseek-key
```

### Production Deployment

1. **Enable HTTPS**: All traffic should use HTTPS
2. **Set proper CORS**: Configure allowed origins
3. **Update dependencies**: Run `bundle update` regularly
4. **Monitor logs**: Set up log aggregation and alerts
5. **Backup secrets**: Securely backup credentials
6. **IP Whitelisting**: Consider restricting webhook IPs to OpenWa servers only

### Monitoring & Alerts

Set up alerts for:
- Multiple 404s from same IP (scanning)
- Rate limit violations
- Invalid webhook signatures
- Suspicious path attempts

Example Render.com alert:
```
Alert when log contains "rate limited" OR "Invalid webhook signature" OR "Suspicious request"
```

---

## 6. Disabling Signature Verification (Development Only)

In development, if you don't set `openwa_webhook_secret` in credentials, signature verification is skipped automatically.

To test without signature:
```bash
# Don't add openwa_webhook_secret to development credentials
bin/rails credentials:edit
# Leave it blank
```

---

## Testing Signature Verification

### Ruby test example:

```ruby
# Test in rails console
secret = Rails.application.credentials.dig(:openwa_webhook_secret)
session_id = "test-123"
event = "message.received"
timestamp = "2026-07-27T16:21:24.804Z"

payload = "#{session_id}|#{event}|#{timestamp}"
signature = OpenSSL::HMAC.hexdigest('SHA256', secret, payload)

# Should match the header sent by OpenWa
puts "Expected signature: #{signature}"
```

---

## Troubleshooting

### Webhook returns 401 (Unauthorized)

**Cause**: Signature doesn't match
- Verify the secret matches in both OpenWa and Rails credentials
- Check that payload format matches: `sessionId|event|timestamp`
- Ensure timestamp format is ISO 8601

### Rate limit blocks legitimate traffic

**Solution**: Increase limits in `rate_limit_middleware.rb` or whitelist IPs

### Health checks are blocked

**Check**: Health checks to `/` or `/health` are automatically excluded

---

## References

- [OWASP Security Headers](https://owasp.org/www-project-secure-headers/)
- [HMAC Signature Verification](https://tools.ietf.org/html/rfc4868)
- [Rate Limiting Best Practices](https://cloud.google.com/architecture/rate-limiting-strategies-techniques)
