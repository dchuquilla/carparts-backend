# OpenapiClient::SendMedia

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **media** | [**SendMediaMedia**](SendMediaMedia.md) |  | [optional] |
| **mime_type** | **String** | Mime type of media | [optional] |
| **no_encode** | **Boolean** | Do not use our encoding | [optional] |
| **no_cache** | **Boolean** | Do not use the cache in a request | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::SendMedia.new(
  media: null,
  mime_type: null,
  no_encode: null,
  no_cache: null
)
```

