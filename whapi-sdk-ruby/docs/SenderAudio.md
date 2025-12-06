# OpenapiClient::SenderAudio

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **to** | **String** | Use the phone number or [Chat ID](https://support.whapi.cloud/help-desk/faq/chat-id.-what-is-it-and-how-to-get-it) of the contact/group/channel to which you want to send the message. Use [Get groups](https://whapi.readme.io/reference/getgroups) to get the group ID. |  |
| **quoted** | **String** | Message ID of the message to be quoted | [optional] |
| **ephemeral** | **Integer** | Time in seconds for the message to be deleted. The Disappearing messages setting should be enabled in the chat where you are sending this message. | [optional] |
| **edit** | **String** | Message ID of the message to be edited | [optional] |
| **media** | [**SendMediaMedia**](SendMediaMedia.md) |  |  |
| **mime_type** | **String** | Mime type of media | [optional] |
| **no_encode** | **Boolean** | Do not use our encoding | [optional] |
| **no_cache** | **Boolean** | Do not use the cache in a request | [optional] |
| **seconds** | **Integer** | Optional. For audio files, this field indicates the duration of the audio file in seconds. | [optional] |
| **view_once** | **Boolean** | Is view once | [optional] |
| **background_color** | **String** | Background color of the story (ARGB) | [optional][default to &#39;#00000000&#39;] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::SenderAudio.new(
  to: 1234567891@s.whatsapp.net,
  quoted: null,
  ephemeral: null,
  edit: null,
  media: null,
  mime_type: null,
  no_encode: null,
  no_cache: null,
  seconds: null,
  view_once: null,
  background_color: #FF000000
)
```

