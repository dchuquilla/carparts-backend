# OpenapiClient::Health

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **start_at** | **Float** | Date timestamp when channel started on the server. |  |
| **uptime** | **Float** | Seconds have passed since the start of the instance. |  |
| **version** | **String** | Channel version | [optional] |
| **device_id** | **Float** | Current device ID | [optional] |
| **ip** | **String** | Current channel ip-address | [optional] |
| **status** | [**ChannelStatus**](ChannelStatus.md) |  |  |
| **user** | [**Contact**](Contact.md) |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Health.new(
  start_at: null,
  uptime: null,
  version: null,
  device_id: null,
  ip: null,
  status: null,
  user: null
)
```

