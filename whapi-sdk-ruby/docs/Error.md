# OpenapiClient::Error

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **Integer** | See the https://whapi.cloud/docs/whatsapp/api/errors for more information. |  |
| **message** | **String** | error message |  |
| **details** | **String** | error detail | [optional] |
| **href** | **String** | location for error detail | [optional] |
| **support** | **String** | support contact | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Error.new(
  code: null,
  message: null,
  details: null,
  href: null,
  support: null
)
```

