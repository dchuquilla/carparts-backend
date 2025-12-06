# OpenapiClient::ProductEdit

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **product_retailer_id** | **String** | Product Retailer ID | [optional] |
| **currency** | [**Currency**](Currency.md) |  | [optional] |
| **images** | [**Array&lt;GroupIconParametersMedia&gt;**](GroupIconParametersMedia.md) | Product images urls |  |
| **availability** | **String** | Product availability | [optional] |
| **name** | **String** | Product name | [optional] |
| **url** | **String** | Product url | [optional] |
| **description** | **String** | Product description | [optional] |
| **price** | **Float** | Product price | [optional] |
| **is_hidden** | **Boolean** | Product is hidden | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::ProductEdit.new(
  product_retailer_id: null,
  currency: null,
  images: null,
  availability: null,
  name: null,
  url: null,
  description: null,
  price: null,
  is_hidden: null
)
```

