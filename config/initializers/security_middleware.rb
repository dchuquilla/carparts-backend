Rails.application.config.middleware.insert_before 0, SecurityHeadersMiddleware
Rails.application.config.middleware.insert_before 1, RateLimitMiddleware
