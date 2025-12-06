# OpenapiClient::MessageContentSticker

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
| **animated** | **Boolean** | Optional. For stickers, this field indicates whether the sticker is animated. | [optional] |
| **width** | **Integer** | Width of the media in pixels | [optional] |
| **height** | **Integer** | Height of the media in pixels | [optional] |
| **view_once** | **Boolean** | Is view once | [optional] |
| **preview** | **String** | Optional. Base64 encoded preview of the media. In PNG format. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessageContentSticker.new(
  id: null,
  link: null,
  mime_type: null,
  file_size: null,
  file_name: null,
  sha256: null,
  timestamp: null,
  animated: null,
  width: null,
  height: null,
  view_once: null,
  preview: null
)
```

