# OpenapiClient::GroupInfoByInviteCode

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Chat ID | [optional] |
| **name_at** | **Integer** | Group name change timestamp | [optional] |
| **name** | **String** | Group name | [optional] |
| **participants** | [**Array&lt;Participant&gt;**](Participant.md) | Group participants | [optional] |
| **participants_count** | **Float** | Group participants count | [optional] |
| **created_at** | **Integer** | Group creation timestamp | [optional] |
| **created_by** | **String** | Contact ID | [optional] |
| **ephemeral** | **Float** | Group ephemeral timer | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::GroupInfoByInviteCode.new(
  id: null,
  name_at: 1675964377,
  name: Group name,
  participants: null,
  participants_count: null,
  created_at: 1675964377,
  created_by: null,
  ephemeral: 0
)
```

