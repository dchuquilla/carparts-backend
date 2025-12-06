# OpenapiClient::MessagePropsGif

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **caption** | **String** | Optional. Text caption under the media. | [optional] |
| **preview** | **String** | Optional. Base64 encoded preview of the media. In JPEG format. | [optional] |
| **width** | **Integer** | Width of the media in pixels | [optional] |
| **height** | **Integer** | Height of the media in pixels | [optional] |
| **autoplay** | **Boolean** | Optional. This field indicates whether the GIF should be played automatically when the message is received. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessagePropsGif.new(
  caption: null,
  preview: null,
  width: null,
  height: null,
  autoplay: null
)
```

