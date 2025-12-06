# OpenapiClient::MediaFile

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

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MediaFile.new(
  id: null,
  link: null,
  mime_type: null,
  file_size: null,
  file_name: null,
  sha256: null,
  timestamp: null
)
```

