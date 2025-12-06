# OpenapiClient::SendPresenceRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **presence** | **String** |  |  |
| **delay** | **Float** | Delay in seconds to simulate typing or recording | [optional][default to 0] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::SendPresenceRequest.new(
  presence: null,
  delay: null
)
```

