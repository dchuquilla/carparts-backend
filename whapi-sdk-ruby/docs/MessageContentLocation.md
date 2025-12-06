# OpenapiClient::MessageContentLocation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **view_once** | **Boolean** | Is view once | [optional] |
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

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessageContentLocation.new(
  view_once: null,
  latitude: null,
  longitude: null,
  address: null,
  name: null,
  url: null,
  preview: null,
  accuracy: null,
  speed: null,
  degrees: null,
  comment: null
)
```

