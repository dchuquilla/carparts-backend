# OpenapiClient::MessageContentInteractive

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **header** | [**MessagePropsInteractiveHeader**](MessagePropsInteractiveHeader.md) |  | [optional] |
| **body** | [**MessagePropsInteractiveBody**](MessagePropsInteractiveBody.md) |  | [optional] |
| **footer** | [**MessagePropsInteractiveFooter**](MessagePropsInteractiveFooter.md) |  | [optional] |
| **action** | [**InteractiveAction**](InteractiveAction.md) |  |  |
| **type** | [**InteractiveType**](InteractiveType.md) |  | [optional][default to &#39;button&#39;] |
| **id** | **String** | Media ID |  |
| **link** | **String** | Optional. Link to media | [optional] |
| **mime_type** | **String** | Mime type of media |  |
| **file_size** | **Integer** | File size in bytes |  |
| **file_name** | **String** | Optional. File name | [optional] |
| **sha256** | **String** | Checksum | [optional] |
| **timestamp** | **Float** | Created at | [optional] |
| **view_once** | **Boolean** | Is view once | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessageContentInteractive.new(
  header: null,
  body: null,
  footer: null,
  action: null,
  type: null,
  id: null,
  link: null,
  mime_type: null,
  file_size: null,
  file_name: null,
  sha256: null,
  timestamp: null,
  view_once: null
)
```

