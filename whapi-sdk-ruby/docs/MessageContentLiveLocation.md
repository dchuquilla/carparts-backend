# OpenapiClient::MessageContentLiveLocation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **view_once** | **Boolean** | Is view once | [optional] |
| **latitude** | **Float** | Latitude of live location being sent |  |
| **longitude** | **Float** | Longitude of live location being sent |  |
| **accuracy** | **Integer** | Accuracy of the live location in meters | [optional] |
| **speed** | **Integer** | Speed of the live location in meters per second | [optional] |
| **degrees** | **Integer** | Degrees clockwise from true north | [optional] |
| **caption** | **String** | Optional. Text caption under the live location | [optional] |
| **sequence_number** | **Integer** | Optional. Sequence number of the live location for event tracking | [optional] |
| **time_offset** | **Float** | Optional. Time offset of the live location | [optional] |
| **preview** | **String** | Optional. Base64 encoded preview of the media. In JPEG format. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessageContentLiveLocation.new(
  view_once: null,
  latitude: null,
  longitude: null,
  accuracy: null,
  speed: null,
  degrees: null,
  caption: null,
  sequence_number: null,
  time_offset: null,
  preview: null
)
```

