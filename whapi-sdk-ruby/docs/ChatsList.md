# OpenapiClient::ChatsList

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **count** | **Integer** | Count of requested chats | [optional][default to 20] |
| **total** | **Integer** | Total number of returned chats | [optional] |
| **offset** | **Integer** | Offset of requested chats | [optional][default to 0] |
| **chats** | [**Array&lt;Chat&gt;**](Chat.md) |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::ChatsList.new(
  count: null,
  total: null,
  offset: null,
  chats: null
)
```

