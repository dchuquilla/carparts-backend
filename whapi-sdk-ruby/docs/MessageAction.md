# OpenapiClient::MessageAction

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **target** | **String** | Target message ID or chat ID | [optional] |
| **type** | **String** | Type of action |  |
| **emoji** | **String** | Action emoji for reaction | [optional] |
| **ephemeral** | **Integer** | Ephemeral message duration | [optional] |
| **edited_type** | [**MessageType**](MessageType.md) |  | [optional][default to &#39;text&#39;] |
| **edited_content** | [**MessageContent**](MessageContent.md) |  | [optional] |
| **votes** | **Array&lt;String&gt;** | List of poll options | [optional] |
| **comment** | **String** | Comment | [optional] |
| **event_response** | [**EventResponse**](EventResponse.md) |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessageAction.new(
  target: null,
  type: null,
  emoji: null,
  ephemeral: null,
  edited_type: null,
  edited_content: null,
  votes: null,
  comment: null,
  event_response: null
)
```

