# OpenapiClient::ProductItem

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Product ID | [optional] |
| **product_retailer_id** | **String** | Product Retailer ID | [optional] |
| **name** | **String** | Product name | [optional] |
| **image** | **String** | Product image URL | [optional] |
| **quantity** | **Integer** | Quantity | [optional] |
| **price** | **Float** | Item price | [optional] |
| **currency** | [**Currency**](Currency.md) |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::ProductItem.new(
  id: null,
  product_retailer_id: null,
  name: null,
  image: null,
  quantity: null,
  price: null,
  currency: null
)
```

