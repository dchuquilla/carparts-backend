# OpenapiClient::MessageUpdate

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Message ID |  |
| **trigger** | [**Message**](Message.md) |  | [optional] |
| **before_update** | [**Message**](Message.md) |  |  |
| **after_update** | [**Message**](Message.md) |  |  |
| **changes** | **Array&lt;String&gt;** |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessageUpdate.new(
  id: null,
  trigger: null,
  before_update: null,
  after_update: null,
  changes: null
)
```

