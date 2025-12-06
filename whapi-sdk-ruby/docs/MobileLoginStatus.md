# OpenapiClient::MobileLoginStatus

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **phone_number** | [**MobileLoginStatusPhoneNumber**](MobileLoginStatusPhoneNumber.md) |  |  |
| **method** | [**MobileLoginMethod**](MobileLoginMethod.md) |  | [default to &#39;sms&#39;] |
| **captcha** | **String** | Captcha code in base64 | [optional] |
| **status** | **String** | Login status | [optional] |
| **error** | **String** | Error message | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MobileLoginStatus.new(
  phone_number: null,
  method: null,
  captcha: null,
  status: sent,
  error: Error message
)
```

