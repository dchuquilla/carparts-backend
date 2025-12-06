# OpenapiClient::ProductsList

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **count** | **Integer** | Count of requested chats | [optional][default to 20] |
| **total** | **Integer** | Total number of returned chats | [optional] |
| **offset** | **Integer** | Offset of requested chats | [optional][default to 0] |
| **products** | [**Array&lt;Product&gt;**](Product.md) |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::ProductsList.new(
  count: null,
  total: null,
  offset: null,
  products: null
)
```

