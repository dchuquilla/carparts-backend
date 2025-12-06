# OpenapiClient::CallEvent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The ID of the call. | [optional] |
| **chat_id** | **String** | The ID of the chat that the call is associated with. | [optional] |
| **status** | **String** | The status of the call. | [optional] |
| **from** | **String** | The ID of the contact that initiated the call. | [optional] |
| **timestamp** | **Integer** | The timestamp of the call. | [optional] |
| **group_call** | **Boolean** | Whether the call is a group call. | [optional] |
| **video_call** | **Boolean** | Whether the call is a video call. | [optional] |
| **offline_call** | **Boolean** | Whether the call is an offline call. | [optional] |
| **latency** | **Integer** | The latency of the call in milliseconds. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::CallEvent.new(
  id: null,
  chat_id: null,
  status: null,
  from: null,
  timestamp: null,
  group_call: null,
  video_call: null,
  offline_call: null,
  latency: null
)
```

