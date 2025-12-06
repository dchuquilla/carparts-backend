# OpenapiClient::SenderLiveLocation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **to** | **String** | Use the phone number or [Chat ID](https://support.whapi.cloud/help-desk/faq/chat-id.-what-is-it-and-how-to-get-it) of the contact/group/channel to which you want to send the message. Use [Get groups](https://whapi.readme.io/reference/getgroups) to get the group ID. |  |
| **quoted** | **String** | Message ID of the message to be quoted | [optional] |
| **ephemeral** | **Integer** | Time in seconds for the message to be deleted. The Disappearing messages setting should be enabled in the chat where you are sending this message. | [optional] |
| **edit** | **String** | Message ID of the message to be edited | [optional] |
| **latitude** | **Float** | Latitude of location being sent |  |
| **longitude** | **Float** | Longitude of location being sent |  |
| **address** | **String** | Address of the location | [optional] |
| **name** | **String** | Name of the location | [optional] |
| **url** | **String** | URL for the website where the user downloaded the location information | [optional] |
| **preview** | **String** | Optional. Base64 encoded preview of the media. In JPEG format. | [optional] |
| **accuracy** | **Integer** | Accuracy of the location in meters | [optional] |
| **speed** | **Integer** | Speed of the location in meters per second | [optional] |
| **degrees** | **Integer** | Degrees clockwise from true north | [optional] |
| **comment** | **String** | Optional. Comment for the location | [optional] |
| **view_once** | **Boolean** | Is view once | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::SenderLiveLocation.new(
  to: 1234567891@s.whatsapp.net,
  quoted: null,
  ephemeral: null,
  edit: null,
  latitude: null,
  longitude: null,
  address: null,
  name: null,
  url: null,
  preview: null,
  accuracy: null,
  speed: null,
  degrees: null,
  comment: null,
  view_once: null
)
```

