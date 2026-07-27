require_relative '../../app/middleware/security_headers_middleware'
require_relative '../../app/middleware/rate_limit_middleware'

Rails.application.config.middleware.insert_before 0, SecurityHeadersMiddleware
Rails.application.config.middleware.insert_before 1, RateLimitMiddleware
