# OpenapiClient::PatchChatRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **pin** | **Boolean** | Pin or unpin chat | [optional] |
| **mute_until** | **Integer** | Mute chat until. 0 - unmute chat | [optional] |
| **mark_unread** | **Boolean** | Mark as unread/read chat | [optional] |
| **ephemeral** | **String** | Amount of days to store messages, when set to none will store infinitely | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::PatchChatRequest.new(
  pin: true,
  mute_until: 0,
  mark_unread: true,
  ephemeral: week
)
```

