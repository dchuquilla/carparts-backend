# OpenapiClient::MessageContentNewsletterAdminInvite

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **body** | **String** | Message text |  |
| **newsletter_id** | **String** | Newsletter ID |  |
| **newsletter_name** | **String** | Newsletter name |  |
| **expiration** | **Float** | Expiration timestamp of the invitation |  |
| **preview** | **String** | Base64 encoded newsletter preview image. In JPEG format | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessageContentNewsletterAdminInvite.new(
  body: null,
  newsletter_id: null,
  newsletter_name: null,
  expiration: null,
  preview: null
)
```

