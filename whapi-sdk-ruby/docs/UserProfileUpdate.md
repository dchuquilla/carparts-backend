# OpenapiClient::UserProfileUpdate

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | Update user name. | [optional] |
| **about** | **String** | Update user info in About section. | [optional] |
| **icon** | **String** | Update user icon in base64/url. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::UserProfileUpdate.new(
  name: null,
  about: null,
  icon: null
)
```

