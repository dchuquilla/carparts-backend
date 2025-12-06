# OpenapiClient::MediaSettings

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **auto_download** | **Array&lt;String&gt;** | An array specifying which types of media to automatically download. | [optional] |
| **init_avatars** | **Boolean** | Set to true if you need to get avatars after channel authorization | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MediaSettings.new(
  auto_download: null,
  init_avatars: null
)
```

