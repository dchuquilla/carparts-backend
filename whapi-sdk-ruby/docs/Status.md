# OpenapiClient::Status

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **errors** | [**Array&lt;Error&gt;**](Error.md) |  | [optional] |
| **id** | **String** | Message ID from event |  |
| **code** | **Float** | Status code |  |
| **status** | [**StatusEnum**](StatusEnum.md) |  |  |
| **recipient_id** | **String** | Chat ID | [optional] |
| **viewer_id** | **String** | Contact ID | [optional] |
| **timestamp** | **String** | Timestamp of the status message |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Status.new(
  errors: null,
  id: null,
  code: null,
  status: null,
  recipient_id: null,
  viewer_id: null,
  timestamp: null
)
```

