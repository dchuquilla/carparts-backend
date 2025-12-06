# OpenapiClient::MessageContentLinkPreview

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **body** | **String** | Message text |  |
| **title** | **String** | Title of the link |  |
| **description** | **String** | Description of the link | [optional] |
| **canonical** | **String** | Canonical URL of the link (for example, if the link is shortened) | [optional] |
| **preview** | **String** | Base64 encoded image for mini version link preview. In JPEG format | [optional] |
| **view_once** | **Boolean** | Is view once | [optional] |
| **url** | **String** | URL of the link | [optional] |
| **id** | **String** | Media ID | [optional] |
| **link** | **String** | Optional. Link to media | [optional] |
| **sha256** | **String** | Checksum | [optional] |
| **catalog_id** | **String** | Contact ID | [optional] |
| **newsletter_id** | **String** | Newsletter ID | [optional] |
| **invite_code** | **String** | Invite code | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessageContentLinkPreview.new(
  body: null,
  title: null,
  description: null,
  canonical: null,
  preview: null,
  view_once: null,
  url: null,
  id: null,
  link: null,
  sha256: null,
  catalog_id: null,
  newsletter_id: null,
  invite_code: null
)
```

