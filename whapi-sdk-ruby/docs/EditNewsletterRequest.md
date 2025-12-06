# OpenapiClient::EditNewsletterRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** |  | [optional] |
| **description** | **String** |  | [optional] |
| **newsletter_pic** | **String** | Newsletter jpeg picture in base64 format | [optional] |
| **reactions** | **String** | Available reactions | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::EditNewsletterRequest.new(
  name: &lt;Newsletter Title&gt;,
  description: &lt;Newsletter Description&gt;,
  newsletter_pic: &lt;data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAAAAAAAD/&gt;,
  reactions: null
)
```

