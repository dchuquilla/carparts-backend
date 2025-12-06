# OpenapiClient::Newsletter

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Chat ID |  |
| **name** | **String** | Newsletter name |  |
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
| **name_at** | **Integer** | Newsletter name change timestamp | [optional] |
| **description** | **String** | Newsletter description | [optional] |
| **description_at** | **String** | Newsletter description change timestamp | [optional] |
| **subscribers_count** | **Integer** | Newsletter subscribers count | [optional] |
| **created_at** | **Integer** | Newsletter creation timestamp | [optional] |
| **invite_code** | **String** | Newsletter invite code | [optional] |
| **handle** | **String** | Newsletter handle | [optional] |
| **verification** | **Boolean** | Is newsletter verified | [optional] |
| **preview** | **String** | Newsletter preview URL | [optional] |
| **role** | **String** | User&#39;s role regarding the newsletter | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Newsletter.new(
  id: null,
  name: Newsletter name,
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
  name_at: 1675964377,
  description: Newsletter description,
  description_at: Newsletter description ID,
  subscribers_count: 2,
  created_at: 1675964377,
  invite_code: Newsletter invite code,
  handle: Newsletter handle,
  verification: true,
  preview: https://example.com/photo.jpg,
  role: null
)
```

