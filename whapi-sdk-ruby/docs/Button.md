# OpenapiClient::Button

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | Type of button |  |
| **title** | **String** | Button text |  |
| **id** | **String** | Button ID |  |
| **copy_code** | **String** | Button code for copy type | [optional] |
| **phone_number** | **String** | Button phone number for call type | [optional] |
| **url** | **String** | Button url for url type | [optional] |
| **merchant_url** | **String** | Button merchant_url for url type | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Button.new(
  type: null,
  title: null,
  id: null,
  copy_code: null,
  phone_number: null,
  url: null,
  merchant_url: null
)
```

