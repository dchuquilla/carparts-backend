# OpenapiClient::ParticipantEvent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **group_id** | **String** | Group ID |  |
| **participants** | **Array&lt;String&gt;** |  |  |
| **action** | **String** | Participant action |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::ParticipantEvent.new(
  group_id: null,
  participants: null,
  action: promote
)
```

