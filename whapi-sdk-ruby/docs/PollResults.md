# OpenapiClient::PollResults

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | option ID |  |
| **name** | **String** | option name |  |
| **count** | **Integer** | Number of votes for this option |  |
| **voters** | **Array&lt;String&gt;** | List of users who voted for this option |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::PollResults.new(
  id: null,
  name: null,
  count: null,
  voters: null
)
```

