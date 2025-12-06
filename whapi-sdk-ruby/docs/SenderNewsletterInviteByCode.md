# OpenapiClient::SenderNewsletterInviteByCode

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **to** | **String** | Use the phone number or [Chat ID](https://support.whapi.cloud/help-desk/faq/chat-id.-what-is-it-and-how-to-get-it) of the contact/group/channel to which you want to send the message. Use [Get groups](https://whapi.readme.io/reference/getgroups) to get the group ID. |  |
| **quoted** | **String** | Message ID of the message to be quoted | [optional] |
| **ephemeral** | **Integer** | Time in seconds for the message to be deleted. The Disappearing messages setting should be enabled in the chat where you are sending this message. | [optional] |
| **edit** | **String** | Message ID of the message to be edited | [optional] |
| **media** | [**SendMediaMedia**](SendMediaMedia.md) |  | [optional] |
| **mime_type** | **String** | Mime type of media | [optional] |
| **no_encode** | **Boolean** | Do not use our encoding | [optional] |
| **no_cache** | **Boolean** | Do not use the cache in a request | [optional] |
| **mentions** | **Array&lt;String&gt;** | The numbers of the mentioned users | [optional] |
| **view_once** | **Boolean** | Is view once | [optional] |
| **title** | **String** | Title of the newsletter. If not set, the newsletter title will be used | [optional] |
| **body** | **String** | Invite message with link. Example: \&quot;Follow this link to join my newsletter on WhatsApp\&quot;. Use %URL% to insert the invite link.  | [optional] |
| **preview_type** | **String** | Type of the newsletter preview. Use &#39;newsletter_picture&#39; to set a newsletter picture as large preview, &#39;thumbnail&#39; to set a custom small jpeg image from &#39;preview&#39; param as preview,  &#39;media&#39; to set a custom large image from &#39;media&#39; param as large preview,  &#39;style1&#39; to set a isometric style for newsletter invite link preview stub, &#39;style2&#39; to set a flat style for newsletter invite link preview stub, &#39;style3&#39; to set a WA style for newsletter invite link preview stub, or &#39;none&#39; to not set a preview. If not set, the default is newsletter_picture.  | [optional][default to &#39;newsletter_picture&#39;] |
| **preview** | **String** | Base64 encoded image for small version newsletter invite link preview (preview_type&#x3D;thumbnail). In JPEG format | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::SenderNewsletterInviteByCode.new(
  to: 1234567891@s.whatsapp.net,
  quoted: null,
  ephemeral: null,
  edit: null,
  media: null,
  mime_type: null,
  no_encode: null,
  no_cache: null,
  mentions: null,
  view_once: null,
  title: null,
  body: null,
  preview_type: null,
  preview: null
)
```

