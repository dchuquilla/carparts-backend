# OpenapiClient::MessagePropsPoll

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **title** | **String** | Title of poll |  |
| **options** | **Array&lt;String&gt;** | Options of poll |  |
| **count** | **Integer** | Number of selectable options in poll (1 - can choose only one option, 0 - any number of options) | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessagePropsPoll.new(
  title: null,
  options: null,
  count: null
)
```

