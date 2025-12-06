# OpenapiClient::MessageContentOrder

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **order_id** | **String** | Order ID | [optional] |
| **seller** | **String** | Seller ID (Contact ID) | [optional] |
| **title** | **String** | Order title | [optional] |
| **text** | **String** | Order message text | [optional] |
| **token** | **String** | Base64 secret token | [optional] |
| **item_count** | **Float** | Total products count | [optional] |
| **currency** | [**Currency**](Currency.md) |  | [optional] |
| **total_price** | **Float** | Total order price | [optional] |
| **status** | **String** | Order status | [optional] |
| **preview** | **String** | Order preview base64 image JPEG | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessageContentOrder.new(
  order_id: null,
  seller: null,
  title: null,
  text: null,
  token: null,
  item_count: null,
  currency: null,
  total_price: null,
  status: null,
  preview: null
)
```

