# OpenapiClient::MessageContentEvent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **is_canceled** | **Boolean** | True if event is canceled | [optional] |
| **name** | **String** | Event name | [optional] |
| **description** | **String** | Event description | [optional] |
| **join_link** | **String** | Join link | [optional] |
| **start** | **Integer** | Chat timestamp | [optional] |
| **responses** | [**Array&lt;EventResponse&gt;**](EventResponse.md) | Event responses | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessageContentEvent.new(
  is_canceled: false,
  name: Some name,
  description: Some description,
  join_link: https://call.whatsapp.com/voice/K5IFl19olpzTLsh52A0G9R,
  start: 1675964377,
  responses: null
)
```

