# OpenapiClient::MessageContentDocument

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
| **caption** | **String** | Optional. Text caption under the document. | [optional] |
| **filename** | **String** | Optional. File name | [optional] |
| **buttons** | [**Array&lt;Button&gt;**](Button.md) |  | [optional] |
| **view_once** | **Boolean** | Is view once | [optional] |
| **page_count** | **Integer** | Optional. Number of pages | [optional] |
| **preview** | **String** | Optional. Base64 encoded preview of the media. In JPEG format. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessageContentDocument.new(
  id: null,
  link: null,
  mime_type: null,
  file_size: null,
  file_name: null,
  sha256: null,
  timestamp: null,
  caption: null,
  filename: null,
  buttons: null,
  view_once: null,
  page_count: null,
  preview: null
)
```

