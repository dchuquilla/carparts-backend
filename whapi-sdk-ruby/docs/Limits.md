# OpenapiClient::Limits

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **messages** | **Integer** | Maximum number of messages that can be sent |  |
| **chats** | **Array&lt;String&gt;** | List of chat IDs that can be used |  |
| **checks** | **Integer** | Maximum number of check phone numbers |  |
| **requests** | **Integer** | Maximum number of channel requests |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Limits.new(
  messages: 100,
  chats: null,
  checks: 100,
  requests: 1000
)
```

