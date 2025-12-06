# OpenapiClient::BusinessCollectionList

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **count** | **Integer** | Count of requested chats | [optional][default to 20] |
| **total** | **Integer** | Total number of returned chats | [optional] |
| **offset** | **Integer** | Offset of requested chats | [optional][default to 0] |
| **collections** | [**Array&lt;BusinessCollection&gt;**](BusinessCollection.md) |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::BusinessCollectionList.new(
  count: null,
  total: null,
  offset: null,
  collections: null
)
```

