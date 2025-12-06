# OpenapiClient::BusinessProfileCustom

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **address** | **String** | Address of the business Maximum of 256 characters | [optional] |
| **description** | **String** | Description of the business Maximum of 256 characters | [optional] |
| **email** | **String** | Email address to contact the business Maximum of 128 characters | [optional] |
| **hours** | [**BusinessProfileCustomHours**](BusinessProfileCustomHours.md) |  | [optional] |
| **websites** | **Array&lt;String&gt;** | URLs associated with business (e.g., website, Facebook page, Instagram) Maximum of 2 websites with a maximum of 256 characters each | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::BusinessProfileCustom.new(
  address: null,
  description: null,
  email: null,
  hours: null,
  websites: null
)
```

