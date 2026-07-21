# CarParts Backend

A Rails 8.0.2 API backend for an auto parts marketplace platform that connects car owners looking for parts with suppliers/stores who have those parts.

## Overview

CarParts Backend is built with Ruby on Rails and provides a RESTful API for:
- User authentication and store management
- Auto parts request creation and tracking
- Seller proposals and acceptance workflow
- WhatsApp integration for real-time customer notifications
- Admin dashboard for store management

## Technology Stack

- Framework: Ruby on Rails 8.0.2
- Database: PostgreSQL
- Job Queue: Solid Queue
- Caching: Solid Cache
- WebSocket: Solid Cable
- Authentication: Devise with JWT tokens
- API Documentation: rswag (Swagger/OpenAPI)
- Admin Panel: Rails Admin
- Filtering: Ransack
- Pagination: Pagy
- Cloud Storage: AWS S3
- Deployment: Kamal (Docker containerization)

## Core Models

- **User**: Store/business owners with subscription tiers (free, paid, wait, cancel, test)
- **Store**: Associated one-to-one with each User
- **Request**: Customer requests for auto parts (part name, brand, model, year, image, chassis)
- **Proposal**: Seller responses to customer requests
- **WebhookEvent**: Logs of incoming webhook events from OpenWa

## System Requirements

- Ruby 3.2.0+
- PostgreSQL 12+
- Node.js 16+ (for assets)
- Redis (optional, for caching)

## Setup Instructions

### 1. Installation

Clone the repository and install dependencies:

```bash
git clone <repository-url>
cd carparts-backend
bundle install
npm install
```

### 2. Database Setup

Create and initialize the database:

```bash
rails db:create
rails db:migrate
```

### 3. OpenWa Configuration

This application uses OpenWa for WhatsApp integration. You must configure the OpenWa connection before running the application.

#### Add OpenWa Credentials

Edit credentials for your environment:

```bash
rails credentials:edit --environment development
```

This opens the decrypted credentials file. Add the following configuration:

```yaml
openwa_url: "http://localhost:2886"
openwa_token: "owa_k1_a79cd864521793dec251372046cdfb0e699489b94208ef8d6463910dc93b788d"
web_url: "https://your-frontend-url.com"
```

Replace these values with your actual OpenWa instance details:
- openwa_url: The base URL of your self-hosted OpenWa instance
- openwa_token: Your OpenWa API authentication token (Bearer token)
- web_url: The frontend URL for building notification links

Repeat this for test and production environments:

```bash
rails credentials:edit --environment test
rails credentials:edit --environment production
```

For test environment, the credentials can be the same as development since test requests do not actually call OpenWa (guarded by Rails.env.test?).

### 4. Environment Variables

Create a .env file for local development (optional, overrides credentials):

```bash
OPENWA_URL=http://localhost:2886
OPENWA_TOKEN=your_token_here
WEB_URL=https://your-frontend-url.com
RAILS_MASTER_KEY=your_rails_master_key
```

### 5. Start the Application

```bash
rails server
```

The API will be available at http://localhost:3000

## API Documentation

API documentation is available at http://localhost:3000/api-docs after starting the server.

Supported endpoints include:

- POST /api/v1/profiles - Get user profile
- POST /api/v1/requests - Create new parts request
- GET /api/v1/requests - List requests
- POST /api/v1/proposals - Submit a proposal for a request
- PATCH /api/v1/proposals/:id/accept - Accept a proposal
- PATCH /api/v1/proposals/:id/reject - Reject a proposal
- POST /api/v1/stores - Create a new store
- PATCH /api/v1/stores/:id - Update store information
- POST /api/v1/webhooks/openwa - Receive webhook events from OpenWa

## WhatsApp Integration (OpenWa)

### Overview

The application integrates directly with OpenWa for WhatsApp communication. This allows:
- Sending automated notifications to users and store owners
- Receiving message events from customers
- Tracking message delivery status
- Exchanging contact information between parties

### How It Works

1. **Notifications**: When a user creates a request or receives a proposal, the WebhookService uses OpenwaService to send automated messages via WhatsApp.

2. **Webhooks**: OpenWa sends incoming message events to the webhook endpoint at POST /api/v1/webhooks/openwa. The WebhooksController receives and logs these events.

3. **Message Types**:
   - Text messages: Localized notifications about requests and proposals
   - Contact cards: vCard format for sharing store and customer information

### Webhook Setup

To receive webhook events from OpenWa, configure the webhook URL in your OpenWa instance:

Webhook URL: https://your-app-url/api/v1/webhooks/openwa
Authorization: Bearer token (same as openwa_token in credentials)
Events: message, message.status, connection

### Testing OpenWa Integration

The application includes comprehensive tests for the OpenWa integration:

```bash
# Test OpenWa service
rspec spec/services/chatbot/openwa_service_spec.rb

# Test webhook receiver
rspec spec/requests/webhooks_spec.rb

# Test notification service
rspec spec/services/chatbot/webhook_service_spec.rb
```

### OpenWa Service Methods

The OpenwaService class provides the following methods:

```ruby
# Send a text message
Chatbot::OpenwaService.send_message(phone_number, message_text)

# Send a contact card
Chatbot::OpenwaService.send_contact(phone_number, vcard_string)

# Get account information
Chatbot::OpenwaService.get_account_info
```

Phone numbers should be in format without spaces or special characters: "593987654321"

## Running Tests

Run the complete test suite:

```bash
bundle exec rspec
```

Run specific test files:

```bash
bundle exec rspec spec/services/chatbot/openwa_service_spec.rb
bundle exec rspec spec/requests/webhooks_spec.rb
```

## Key Features

### User Subscriptions

Users are organized into subscription tiers:
- free: Free tier with limited features
- paid: Paid subscription with full access
- wait: Waiting for approval
- cancel: Cancelled subscription
- test: Testing tier

Only paid subscribers receive notifications for new requests.

### Request State Tracking

Each request tracks completion percentage based on:
- User phone
- Part name
- Part brand
- Part model
- Part year
- Part image
- Part chassis

The API provides a pending_data field listing which fields are missing.

### Duplicate Detection

The system prevents duplicate requests by creating a digest key based on:
- User phone + Part name + Part brand + Part model + Part year

Duplicates created within the same day are flagged.

## Deployment

This application uses Kamal for containerized deployment:

```bash
kamal deploy
```

For production deployment:

1. Ensure all credentials are set in production environment
2. Update OpenWa webhook URL to point to production domain
3. Configure PostgreSQL, Redis, and other services
4. Set up SSL certificates for HTTPS

See .kamal/config.yml for deployment configuration.

## Admin Dashboard

An admin dashboard is available at /crm_nimda using Rails Admin. Access requires admin user credentials.

## Background Jobs

The application uses Solid Queue for background job processing:

- NotifyRequestsJob: Sends periodic reminders to stores about pending requests

Configure Solid Queue in config/solid_queue.yml for your deployment environment.

## Troubleshooting

### OpenWa Connection Issues

If messages are not being sent:

1. Verify OpenWa instance is running and accessible
2. Check OpenWa token is correct in credentials
3. Review application logs: tail -f log/development.log
4. Verify phone numbers include country code without + or spaces

### Webhook Not Receiving Events

If webhook events are not being logged:

1. Verify webhook URL is correctly configured in OpenWa
2. Check webhook authentication token matches openwa_token in credentials
3. Review webhook event logs in database: WebhookEvent.recent
4. Ensure firewall allows incoming requests to webhook endpoint

### Database Connection Issues

If database connections fail:

1. Verify PostgreSQL is running
2. Check database.yml configuration
3. Ensure database user has correct permissions
4. Run rails db:create and rails db:migrate

## Development

### Code Style

The project uses Rubocop for code style:

```bash
bundle exec rubocop
bundle exec rubocop -A  # Auto-fix issues
```

### Security Analysis

Run Brakeman for security vulnerabilities:

```bash
bundle exec brakeman
```

### Database Schema

View the database schema:

```bash
rails db:schema:dump
```

## Contributing

When adding new features that involve notifications:

1. Add the notification method to WebhookService
2. Use OpenwaService.send_message() or send_contact()
3. Add appropriate i18n localization keys
4. Write tests for the new notification flow
5. Update this README if adding new webhook event types

## License

This project is proprietary. All rights reserved.

## Support

For issues or questions, contact the development team.
