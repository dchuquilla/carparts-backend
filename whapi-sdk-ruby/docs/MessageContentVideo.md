# OpenapiClient::MessageContentVideo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Media ID |  |
| **link** | **String** | Optional. Link to media | [optional] |
| **mime_type** | **String** | Mime type of media |  |
| **file_size** | **Integer** | File size in bytes |  |
| **file_name** | **String** | Optional. File name | [optional] |
| **sha256** | **String** | Checksum | [optional] |
| **timestamp** | **Float** | Created at | [optional] |
| **caption** | **String** | Optional. Text caption under the media. | [optional] |
| **preview** | **String** | Optional. Base64 encoded preview of the media. In JPEG format. | [optional] |
| **width** | **Integer** | Width of the media in pixels | [optional] |
| **height** | **Integer** | Height of the media in pixels | [optional] |
| **buttons** | [**Array&lt;Button&gt;**](Button.md) |  | [optional] |
| **view_once** | **Boolean** | Is view once | [optional] |
| **seconds** | **Integer** | Optional. For video files, this field indicates the duration of the video file in seconds. | [optional] |
| **autoplay** | **Boolean** | Optional. If the media is a GIF, this field indicates whether the GIF should be played automatically when the message is received. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessageContentVideo.new(
  id: null,
  link: null,
  mime_type: null,
  file_size: null,
  file_name: null,
  sha256: null,
  timestamp: null,
  caption: null,
  preview: null,
  width: null,
  height: null,
  buttons: null,
  view_once: null,
  seconds: null,
  autoplay: null
)
```

