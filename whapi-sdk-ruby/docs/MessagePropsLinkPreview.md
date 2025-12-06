# OpenapiClient::MessagePropsLinkPreview

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **title** | **String** | Title of the link |  |
| **description** | **String** | Description of the link | [optional] |
| **canonical** | **String** | Canonical URL of the link (for example, if the link is shortened) | [optional] |
| **preview** | **String** | Base64 encoded image for mini version link preview. In JPEG format | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessagePropsLinkPreview.new(
  title: null,
  description: null,
  canonical: null,
  preview: null
)
```

