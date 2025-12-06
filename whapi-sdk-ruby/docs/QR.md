# OpenapiClient::QR

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** | Status of the QR code |  |
| **base64** | **String** | Base64 encoded QR code | [optional] |
| **rowdata** | **String** | Rowdata for generating the QR code | [optional] |
| **expire** | **Float** | Seconds until the QR code expires | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::QR.new(
  status: null,
  base64: null,
  rowdata: null,
  expire: null
)
```

