# OpenWa Integration Guide

This document provides detailed information about the OpenWa integration in CarParts Backend, replacing the previous Whapi implementation.

## What Changed

The application has been migrated from a Whapi-based WhatsApp integration (using an external chatbot microservice) to a direct OpenWa integration.

### Architecture

Before:
```
carparts-backend -> external chatbot service -> Whapi -> WhatsApp
```

After:
```
carparts-backend -> OpenWa API -> WhatsApp
```

## Setup Requirements

### Prerequisites

1. Self-hosted OpenWa instance running and accessible
2. OpenWa instance URL (e.g., http://localhost:2886)
3. OpenWa API authentication token
4. Frontend application URL for notification links

### Configuration Steps

1. Add OpenWa credentials to Rails encrypted credentials:

   Development environment:
   ```bash
   rails credentials:edit --environment development
   ```

   Add the following:
   ```yaml
   openwa_url: "http://localhost:2886"
   openwa_token: "owa_k1_your_token_here"
   web_url: "https://your-frontend-url.com"
   ```

   Repeat for test and production environments:
   ```bash
   rails credentials:edit --environment test
   rails credentials:edit --environment production
   ```

2. Run database migrations to create webhook_events table:
   ```bash
   rails db:migrate
   ```

3. Configure webhook in OpenWa instance settings:
   - Webhook URL: https://your-app-url/api/v1/webhooks/openwa
   - Authorization: Bearer token (use openwa_token value)
   - Events to subscribe: message, message.status, connection

4. Test the connection:
   ```bash
   rails console
   Chatbot::OpenwaService.get_account_info
   ```

## Implementation Details

### Core Components

1. **OpenwaService** (app/services/chatbot/openwa_service.rb)
   - Handles all OpenWa API communication
   - Methods: send_message, send_contact, get_account_info
   - Includes error handling and logging
   - Uses Bearer token authentication

2. **WebhookService** (app/services/chatbot/webhook_service.rb)
   - Refactored to use OpenwaService
   - Maintains all existing notification methods
   - Supports concurrent notifications using Async
   - Includes i18n localization for messages

3. **WebhooksController** (app/controllers/api/v1/webhooks_controller.rb)
   - Receives webhook events from OpenWa
   - Validates webhook authentication
   - Handles message, status, and connection events
   - Logs all events for debugging

4. **WebhookEvent** (app/models/webhook_event.rb)
   - Logs all incoming webhook events
   - Searchable by event type, source phone, and date
   - Useful for troubleshooting and audit trails

### Notification Flow

1. User or system action triggers notification (request created, proposal accepted, etc.)
2. WebhookService determines notification type and recipient
3. WebhookService calls OpenwaService.send_message or send_contact
4. OpenwaService prepares HTTP request with authentication
5. OpenwaService sends request to OpenWa API
6. OpenWa sends message via WhatsApp
7. Customer receives message on WhatsApp

### Webhook Event Flow

1. Customer sends message or OpenWa sends status update
2. OpenWa sends webhook POST to /api/v1/webhooks/openwa
3. WebhooksController validates authentication
4. WebhooksController logs event to WebhookEvent table
5. Event can be queried for debugging or future processing

## Usage Examples

### Send Text Message

```ruby
Chatbot::OpenwaService.send_message("593987654321", "Hello! Your request has been received.")
```

### Send Contact Card

```ruby
vcard = "BEGIN:VCARD\nVERSION:3.0\nFN:Store Name\nTEL:5931234567\nEND:VCARD"
Chatbot::OpenwaService.send_contact("593987654321", vcard)
```

### Notify on Request Creation

This happens automatically via WebhookService:

```ruby
service = Chatbot::WebhookService.new(
  request: request_object,
  url: "/requests/#{request_id}",
  store: store_object
)
service.notify_request_success
```

### Query Webhook Events

```ruby
# Get recent webhook events
WebhookEvent.recent.limit(10)

# Get events by type
WebhookEvent.where(event_type: :message).recent

# Get events from specific phone
WebhookEvent.where(source_phone: "593987654321").recent
```

## Testing

The implementation includes comprehensive test coverage:

### OpenwaService Tests
- Message sending with various phone formats
- Contact card sending
- Error handling for network issues
- Authentication error handling
- Rate limit handling
- Phone number normalization

Run tests:
```bash
bundle exec rspec spec/services/chatbot/openwa_service_spec.rb
```

### WebhooksController Tests
- Valid webhook events reception
- Authorization validation
- Event logging
- Error handling
- Malformed payload handling

Run tests:
```bash
bundle exec rspec spec/requests/webhooks_spec.rb
```

### WebhookService Tests
- All notification methods
- Message localization with i18n
- Async concurrent sends
- Store subscriber notification
- Contact exchange flows

Run tests:
```bash
bundle exec rspec spec/services/chatbot/webhook_service_spec.rb
```

## Phone Number Format

Phone numbers must be in the following format:
- Country code + area code + number
- No spaces, dashes, or special characters
- No + sign prefix

Example: 593987654321 (Ecuador country code 593, followed by phone number)

The OpenwaService automatically normalizes phone numbers by removing special characters.

## Error Handling

### Network Errors

If OpenWa instance is unreachable:
- Error is logged but does not block main request
- Application gracefully handles the failure
- Check logs for specific error message

### Authentication Errors (401/403)

If authentication fails:
- Verify openwa_token is correct in credentials
- Verify Bearer prefix is included
- Check OpenWa instance authentication settings

### Rate Limiting (429)

If rate limited:
- Application logs warning
- Current implementation does not retry
- Consider implementing backoff retry logic if needed

### Invalid Phone Numbers

Phone numbers that fail validation:
- Are logged separately
- Message is skipped for that recipient
- Other recipients still receive messages

## Troubleshooting

### Messages Not Being Sent

Check the following:

1. OpenWa instance is running:
   ```bash
   curl http://localhost:2886/api/me -H "Authorization: Bearer your_token"
   ```

2. Credentials are set correctly:
   ```bash
   rails console
   Rails.application.credentials.dig(:openwa_url)
   Rails.application.credentials.dig(:openwa_token)
   ```

3. Application logs for errors:
   ```bash
   tail -f log/development.log | grep OpenWa
   ```

4. Database has webhook_events table:
   ```bash
   rails db:migrate
   ```

### Webhooks Not Being Received

Check the following:

1. Webhook URL is correct in OpenWa settings
2. Authorization header matches openwa_token
3. Firewall allows incoming connections to webhook endpoint
4. Application is running and accessible from OpenWa instance
5. Check WebhookEvent table for received events:
   ```bash
   WebhookEvent.recent
   ```

### Database Issues

If migrations fail:

```bash
rails db:create
rails db:migrate
rails db:seed  # if seed data exists
```

## Removing Old Chatbot Service References

The external chatbot service URL is no longer used. You can safely remove:

```yaml
# No longer needed in credentials
chatbot_url: "..."
```

This can remain in credentials without causing issues (just unused).

## Future Enhancements

Possible improvements to the OpenWa integration:

1. Implement retry logic with exponential backoff for failed sends
2. Add message queuing for bulk sends during high traffic
3. Add read receipts and delivery status tracking
4. Implement user preferences for notification frequency
5. Add support for media messages (images, documents)
6. Add message templates for common notifications
7. Implement webhook event processing for incoming messages
8. Add analytics for message delivery and engagement

## Support

For issues or questions about the OpenWa integration:

1. Check this documentation
2. Review application logs
3. Check WebhookEvent table for webhook errors
4. Verify OpenWa instance is running and accessible
5. Test OpenWa API connectivity directly
6. Review test files for usage examples

## Related Documentation

- See README.md for overall application setup
- See WebhookService for notification methods
- See OpenwaService for OpenWa API communication
- See spec files for comprehensive usage examples
