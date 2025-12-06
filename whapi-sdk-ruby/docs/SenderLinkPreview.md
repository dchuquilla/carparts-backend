# OpenapiClient::SenderLinkPreview

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **to** | **String** | Use the phone number or [Chat ID](https://support.whapi.cloud/help-desk/faq/chat-id.-what-is-it-and-how-to-get-it) of the contact/group/channel to which you want to send the message. Use [Get groups](https://whapi.readme.io/reference/getgroups) to get the group ID. |  |
| **quoted** | **String** | Message ID of the message to be quoted | [optional] |
| **ephemeral** | **Integer** | Time in seconds for the message to be deleted. The Disappearing messages setting should be enabled in the chat where you are sending this message. | [optional] |
| **edit** | **String** | Message ID of the message to be edited | [optional] |
| **body** | **String** | Message text |  |
| **title** | **String** | Title of the link |  |
| **description** | **String** | Description of the link | [optional] |
| **canonical** | **String** | Canonical URL of the link (for example, if the link is shortened) | [optional] |
| **preview** | **String** | Base64 encoded image for mini version link preview. In JPEG format | [optional] |
| **media** | [**SendMediaMedia**](SendMediaMedia.md) |  | [optional] |
| **mime_type** | **String** | Mime type of media | [optional] |
| **no_encode** | **Boolean** | Do not use our encoding | [optional] |
| **no_cache** | **Boolean** | Do not use the cache in a request | [optional] |
| **mentions** | **Array&lt;String&gt;** | The numbers of the mentioned users | [optional] |
| **view_once** | **Boolean** | Is view once | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::SenderLinkPreview.new(
  to: 1234567891@s.whatsapp.net,
  quoted: null,
  ephemeral: null,
  edit: null,
  body: null,
  title: null,
  description: null,
  canonical: null,
  preview: null,
  media: null,
  mime_type: null,
  no_encode: null,
  no_cache: null,
  mentions: null,
  view_once: null
)
```

