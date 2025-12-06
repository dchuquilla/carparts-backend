# OpenapiClient::SenderText

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **to** | **String** | Use the phone number or [Chat ID](https://support.whapi.cloud/help-desk/faq/chat-id.-what-is-it-and-how-to-get-it) of the contact/group/channel to which you want to send the message. Use [Get groups](https://whapi.readme.io/reference/getgroups) to get the group ID. |  |
| **quoted** | **String** | Message ID of the message to be quoted | [optional] |
| **ephemeral** | **Integer** | Time in seconds for the message to be deleted. The Disappearing messages setting should be enabled in the chat where you are sending this message. | [optional] |
| **edit** | **String** | Message ID of the message to be edited | [optional] |
| **body** | **String** | Message text |  |
| **mentions** | **Array&lt;String&gt;** | The numbers of the mentioned users | [optional] |
| **view_once** | **Boolean** | Is view once | [optional] |
| **typing_time** | **Float** | Time in seconds to simulate typing | [optional][default to 0] |
| **no_link_preview** | **Boolean** | Set \&quot;true\&quot; if necessary to send the link without preview | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::SenderText.new(
  to: 1234567891@s.whatsapp.net,
  quoted: null,
  ephemeral: null,
  edit: null,
  body: null,
  mentions: null,
  view_once: null,
  typing_time: null,
  no_link_preview: null
)
```

