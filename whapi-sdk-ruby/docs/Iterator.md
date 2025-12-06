# OpenapiClient::Iterator

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **count** | **Integer** | Count of requested chats | [optional][default to 20] |
| **total** | **Integer** | Total number of returned chats | [optional] |
| **offset** | **Integer** | Offset of requested chats | [optional][default to 0] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Iterator.new(
  count: null,
  total: null,
  offset: null
)
```

