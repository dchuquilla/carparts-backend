# OpenapiClient::RequestMobileLogin

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **phone_number** | **String** | Contact ID |  |
| **method** | [**MobileLoginMethod**](MobileLoginMethod.md) |  | [optional][default to &#39;sms&#39;] |
| **captcha_code** | **String** | The captcha code | [optional] |
| **code** | **String** | The auth code | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::RequestMobileLogin.new(
  phone_number: null,
  method: null,
  captcha_code: 123456,
  code: 123456
)
```

