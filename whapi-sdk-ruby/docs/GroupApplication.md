# OpenapiClient::GroupApplication

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **chat_id** | **String** | Chat ID | [optional] |
| **request_method** | **String** | Application request method | [optional] |
| **timestamp** | **Float** | Application creation time | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::GroupApplication.new(
  chat_id: null,
  request_method: invite_link,
  timestamp: 1717680789
)
```

