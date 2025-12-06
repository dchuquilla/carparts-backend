# OpenapiClient::BusinessHours

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **day** | **String** | Day of the week | [optional] |
| **mode** | **String** | Mode of working hours. You can not combine both | [optional] |
| **open_time** | **Float** | Representation on hour in minutes. I.e 9 A.M. - 540 | [optional] |
| **close_time** | **Float** | Representation on hour in minutes. I.e 16 - 960 | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::BusinessHours.new(
  day: mon,
  mode: open_24h,
  open_time: 540,
  close_time: 960
)
```

