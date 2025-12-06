# OpenapiClient::SenderCatalogByID

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
| **title** | **String** | Title of the catalog (if not set, the business name will be used) | [optional] |
| **description** | **String** | Description of the catalog | [optional] |
| **body** | **String** | Message text with link. Example: \&quot;Follow this link to view our catalog on WhatsApp\&quot;. Use %URL% to insert the catalog link.  | [optional] |
| **preview_type** | **String** | Type of the catalog preview. Use &#39;product&#39; to set a first product image as preview,  &#39;business_profile&#39; to set the business profile pic as preview,  &#39;thumbnail&#39; to set a custom small jpeg image from &#39;preview&#39; param as preview,  &#39;media&#39; to set a custom large image from &#39;media&#39; param as large preview,  &#39;style1&#39; to set a isometric style for catalog preview stub, &#39;style2&#39; to set a flat style for catalog preview stub, &#39;style3&#39; to set a WA style for catalog preview stub, or &#39;none&#39; to not set a preview. If not set, the default is product.  | [optional][default to &#39;product&#39;] |
| **preview** | **String** | Base64 encoded image for small version catalog preview (preview_type&#x3D;thumbnail). In JPEG format | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::SenderCatalogByID.new(
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
  description: null,
  body: null,
  preview_type: null,
  preview: null
)
```

