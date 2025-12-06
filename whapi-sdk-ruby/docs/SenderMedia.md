# OpenapiClient::SenderMedia

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **to** | **String** | Use the phone number or [Chat ID](https://support.whapi.cloud/help-desk/faq/chat-id.-what-is-it-and-how-to-get-it) of the contact/group/channel to which you want to send the message. Use [Get groups](https://whapi.readme.io/reference/getgroups) to get the group ID. |  |
| **quoted** | **String** | Message ID of the message to be quoted | [optional] |
| **ephemeral** | **Integer** | Time in seconds for the message to be deleted. The Disappearing messages setting should be enabled in the chat where you are sending this message. | [optional] |
| **edit** | **String** | Message ID of the message to be edited | [optional] |
| **width** | **Integer** | Width of the media in pixels | [optional] |
| **height** | **Integer** | Height of the media in pixels | [optional] |
| **mentions** | **Array&lt;String&gt;** | The numbers of the mentioned users | [optional] |
| **view_once** | **Boolean** | Is view once | [optional] |
| **caption** | **String** | Optional. Text caption under the document. | [optional] |
| **preview** | **String** | Optional. Base64 encoded preview of the media. In JPEG format. | [optional] |
| **autoplay** | **Boolean** | Optional. This field indicates whether the GIF should be played automatically when the message is received. | [optional] |
| **animated** | **Boolean** | Optional. For stickers, this field indicates whether the sticker is animated. | [optional] |
| **filename** | **String** | Optional. File name | [optional] |
| **seconds** | **Integer** | Optional. For audio files, this field indicates the duration of the audio file in seconds. | [optional] |
| **recording_time** | **Float** | Time in seconds to simulate recording voice | [optional][default to 0] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::SenderMedia.new(
  to: 1234567891@s.whatsapp.net,
  quoted: null,
  ephemeral: null,
  edit: null,
  width: null,
  height: null,
  mentions: null,
  view_once: null,
  caption: null,
  preview: null,
  autoplay: null,
  animated: null,
  filename: null,
  seconds: null,
  recording_time: null
)
```

