# OpenapiClient::MessageReaction

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Reaction ID | [optional] |
| **emoji** | **String** | Reaction text |  |
| **group_key** | **String** | Reaction group key | [optional] |
| **t** | **Float** | Reaction timestamp | [optional] |
| **unread** | **Boolean** | Is reaction unread | [optional] |
| **count** | **Float** | Reaction count | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessageReaction.new(
  id: null,
  emoji: null,
  group_key: null,
  t: null,
  unread: null,
  count: null
)
```

