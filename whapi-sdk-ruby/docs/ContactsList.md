# OpenapiClient::ContactsList

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **count** | **Integer** | Count of requested chats | [optional][default to 20] |
| **total** | **Integer** | Total number of returned chats | [optional] |
| **offset** | **Integer** | Offset of requested chats | [optional][default to 0] |
| **contacts** | [**Array&lt;Contact&gt;**](Contact.md) |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::ContactsList.new(
  count: null,
  total: null,
  offset: null,
  contacts: null
)
```

