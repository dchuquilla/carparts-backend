# OpenapiClient::MessagePollResults

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **title** | **String** | Title of poll |  |
| **options** | **Array&lt;String&gt;** | Options of poll |  |
| **vote_limit** | **Integer** | Number of selectable options in poll (1 - can choose only one option, 0 - any number of options) | [optional] |
| **total** | **Integer** | Total count of selected options | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessagePollResults.new(
  title: null,
  options: null,
  vote_limit: null,
  total: null
)
```

