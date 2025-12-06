# OpenapiClient::CreateNewsletterRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** |  |  |
| **description** | **String** |  | [optional] |
| **newsletter_pic** | **String** |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::CreateNewsletterRequest.new(
  name: &lt;Newsletter Title&gt;,
  description: &lt;Newsletter Description&gt;,
  newsletter_pic: &lt;Newsletter Picture in base64&gt;
)
```

