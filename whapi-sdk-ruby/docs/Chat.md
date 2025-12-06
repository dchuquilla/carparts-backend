# OpenapiClient::Chat

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Chat ID |  |
| **name** | **String** | Chat name | [optional] |
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

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Chat.new(
  id: null,
  name: Chat name,
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
  labels: null
)
```

