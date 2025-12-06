# OpenapiClient::BusinessCollection

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Collection ID |  |
| **name** | **String** | Collection name |  |
| **products** | [**Array&lt;Product&gt;**](Product.md) | Collection&#39;s Products | [optional] |
| **status** | **String** | Moderation status | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::BusinessCollection.new(
  id: null,
  name: null,
  products: null,
  status: null
)
```

