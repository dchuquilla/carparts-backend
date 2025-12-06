# OpenapiClient::Group

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Chat ID |  |
| **name** | **String** | Group name |  |
| **type** | **String** | Chat type |  |
| **timestamp** | **Integer** | Chat timestamp | [optional] |
| **chat_pic** | **String** | Chat picture URL | [optional] |
| **chat_pic_full** | **String** | Chat full picture URL | [optional] |
| **pin** | **Boolean** | Is chat pinned | [optional] |
| **mute** | **Boolean** | Is chat muted | [optional] |
| **mute_until** | **Integer** | Chat mute until | [optional] |
| **archive** | **Boolean** | Is chat archived | [optional] |
| **unread** | **Integer** | Unread messages count | [optional] |
| **unread_mention** | **Boolean** | Is chat unread mention | [optional] |
| **read_only** | **Boolean** | Is chat read only | [optional] |
| **not_spam** | **Boolean** | Is chat not spam | [optional] |
| **last_message** | [**Message**](Message.md) |  | [optional] |
| **labels** | [**Array&lt;Label&gt;**](Label.md) | Labels associated with chat | [optional] |
| **name_owner** | **String** | Group name owner | [optional] |
| **name_at** | **Integer** | Group name change timestamp | [optional] |
| **description** | **String** | Group description | [optional] |
| **description_owner** | **String** | Group description owner | [optional] |
| **description_id** | **String** | Group description ID | [optional] |
| **size** | **Integer** | Group size |  |
| **participants** | [**Array&lt;Participant&gt;**](Participant.md) | Group participants |  |
| **created_at** | **Integer** | Group creation timestamp | [optional] |
| **created_by** | **String** | Contact ID | [optional] |
| **suspended** | **Boolean** | Is group suspended | [optional] |
| **terminated** | **Boolean** | Is group terminated | [optional] |
| **is_parent** | **Boolean** | Is group parent | [optional] |
| **is_default_subgroup** | **Boolean** | Is group default subgroup | [optional] |
| **restricted** | **Boolean** | If only admins can change group settings | [optional] |
| **announcements** | **Boolean** | If only admins can send messages | [optional] |
| **admin_add_member_mode** | **Boolean** | If only admins can add members | [optional] |
| **ephemeral** | **Float** | Group ephemeral timer | [optional] |
| **invite_code** | **String** | Group invite code | [optional] |
| **is_community_announce** | **Boolean** | If group is community announce | [optional] |
| **linked_parent** | **String** | Chat ID | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Group.new(
  id: null,
  name: Group name,
  type: group,
  timestamp: 1675964377,
  chat_pic: https://example.com/photo.jpg,
  chat_pic_full: https://example.com/photo.jpg,
  pin: true,
  mute: true,
  mute_until: 0,
  archive: true,
  unread: 0,
  unread_mention: false,
  read_only: false,
  not_spam: true,
  last_message: null,
  labels: null,
  name_owner: Group name owner,
  name_at: 1675964377,
  description: Group description,
  description_owner: Group description owner,
  description_id: Group description ID,
  size: 2,
  participants: null,
  created_at: 1675964377,
  created_by: null,
  suspended: false,
  terminated: false,
  is_parent: false,
  is_default_subgroup: false,
  restricted: false,
  announcements: false,
  admin_add_member_mode: null,
  ephemeral: 0,
  invite_code: Group invite code,
  is_community_announce: false,
  linked_parent: null
)
```

