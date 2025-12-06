# OpenapiClient::MessageContentAudio

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
| **seconds** | **Integer** | Optional. For audio files, this field indicates the duration of the audio file in seconds. | [optional] |
| **recording_time** | **Float** | Time in seconds to simulate recording voice | [optional][default to 0] |
| **view_once** | **Boolean** | Is view once | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessageContentAudio.new(
  id: null,
  link: null,
  mime_type: null,
  file_size: null,
  file_name: null,
  sha256: null,
  timestamp: null,
  seconds: null,
  recording_time: null,
  view_once: null
)
```

