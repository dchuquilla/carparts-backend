# OpenapiClient::MessageContentHSM

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **header** | [**MessageContentHSMHeader**](MessageContentHSMHeader.md) |  | [optional] |
| **body** | **String** | Message text | [optional] |
| **footer** | **String** | Message footer | [optional] |
| **buttons** | [**Array&lt;HSMButton&gt;**](HSMButton.md) | Buttons | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessageContentHSM.new(
  header: null,
  body: null,
  footer: null,
  buttons: null
)
```

