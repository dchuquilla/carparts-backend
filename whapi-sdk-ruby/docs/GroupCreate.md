# OpenapiClient::GroupCreate

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Chat ID |  |
| **name** | **String** | Group name |  |
| **type** | **String** | Chat type |  |
| **timestamp** | **Integer** | Chat timestamp | [optional] |
| **participants** | [**Array&lt;Participant&gt;**](Participant.md) | Group participants |  |
| **name_at** | **Integer** | Group name set timestamp | [optional] |
| **created_at** | **Integer** | Group creation timestamp | [optional] |
| **created_by** | **String** | Contact ID | [optional] |
| **unprocessed_participants** | **Array&lt;String&gt;** | Сontacts that could not be added to the group | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::GroupCreate.new(
  id: null,
  name: Group name,
  type: group,
  timestamp: 1675964377,
  participants: null,
  name_at: 1675964377,
  created_at: 1675964377,
  created_by: null,
  unprocessed_participants: null
)
```

