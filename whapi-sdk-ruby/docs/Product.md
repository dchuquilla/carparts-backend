# OpenapiClient::Product

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **product_retailer_id** | **String** | Product Retailer ID | [optional] |
| **currency** | [**Currency**](Currency.md) |  |  |
| **images** | [**Array&lt;GroupIconParametersMedia&gt;**](GroupIconParametersMedia.md) | Product images urls |  |
| **availability** | **String** | Product availability |  |
| **name** | **String** | Product name |  |
| **url** | **String** | Product url | [optional] |
| **description** | **String** | Product description |  |
| **price** | **Float** | Product price |  |
| **is_hidden** | **Boolean** | Product is hidden | [optional] |
| **id** | **String** | Product ID |  |
| **review** | **Object** | Product review status | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Product.new(
  product_retailer_id: null,
  currency: null,
  images: null,
  availability: null,
  name: null,
  url: null,
  description: null,
  price: null,
  is_hidden: null,
  id: null,
  review: null
)
```

