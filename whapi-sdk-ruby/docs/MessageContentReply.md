# OpenapiClient::MessageContentReply

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | Type of message content | [optional] |
| **list_reply** | [**ListReply**](ListReply.md) |  | [optional] |
| **buttons_reply** | [**ButtonsReply**](ButtonsReply.md) |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessageContentReply.new(
  type: null,
  list_reply: null,
  buttons_reply: null
)
```

