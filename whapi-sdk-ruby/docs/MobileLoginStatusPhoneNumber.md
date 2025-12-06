# OpenapiClient::MobileLoginStatusPhoneNumber

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **country** | **String** | Country of the phone number | [optional] |
| **e164_format** | **String** | Phone number in E164 format | [optional] |
| **international_format** | **String** | Phone number in international format | [optional] |
| **national_format** | **String** | Phone number in national format | [optional] |
| **country_code** | **String** | Country code | [optional] |
| **national_number** | **String** | Phone number | [optional] |
| **mcc** | **String** | Mobile Country Code | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MobileLoginStatusPhoneNumber.new(
  country: TR,
  e164_format: 901234567890,
  international_format: +90 123 456 78 90,
  national_format: 0123 456 78 90,
  country_code: 90,
  national_number: 1234567890,
  mcc: 286
)
```

