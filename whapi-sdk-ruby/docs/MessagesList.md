# OpenapiClient::MessagesList

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **messages** | [**Array&lt;Message&gt;**](Message.md) |  | [optional] |
| **count** | **Integer** | Count of requested messages | [optional][default to 100] |
| **total** | **Integer** | Total number of returned messages | [optional] |
| **offset** | **Integer** | Offset of requested messages | [optional][default to 0] |
| **first** | **Integer** | The index of the first message | [optional] |
| **last** | **Integer** | The index of the last message | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessagesList.new(
  messages: null,
  count: null,
  total: null,
  offset: null,
  first: null,
  last: null
)
```

