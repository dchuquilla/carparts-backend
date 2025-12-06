# OpenapiClient::MessagePropsInteractive

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **header** | [**MessagePropsInteractiveHeader**](MessagePropsInteractiveHeader.md) |  | [optional] |
| **body** | [**MessagePropsInteractiveBody**](MessagePropsInteractiveBody.md) |  | [optional] |
| **footer** | [**MessagePropsInteractiveFooter**](MessagePropsInteractiveFooter.md) |  | [optional] |
| **action** | [**InteractiveAction**](InteractiveAction.md) |  |  |
| **type** | [**InteractiveType**](InteractiveType.md) |  | [optional][default to &#39;button&#39;] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessagePropsInteractive.new(
  header: null,
  body: null,
  footer: null,
  action: null,
  type: null
)
```

