# OpenapiClient::MessagePropsImageOrVideo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **width** | **Integer** | Width of the media in pixels | [optional] |
| **height** | **Integer** | Height of the media in pixels | [optional] |
| **caption** | **String** | Optional. Text caption under the media. | [optional] |
| **preview** | **String** | Optional. Base64 encoded preview of the media. In JPEG format. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessagePropsImageOrVideo.new(
  width: null,
  height: null,
  caption: null,
  preview: null
)
```

