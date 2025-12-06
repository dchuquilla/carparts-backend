# OpenapiClient::MessageContentImage

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

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessageContentImage.new(
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
  view_once: null
)
```

