# OpenapiClient::MessagePropsVoice

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **seconds** | **Integer** | Optional. For audio files, this field indicates the duration of the audio file in seconds. | [optional] |
| **recording_time** | **Float** | Time in seconds to simulate recording voice | [optional][default to 0] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessagePropsVoice.new(
  seconds: null,
  recording_time: null
)
```

