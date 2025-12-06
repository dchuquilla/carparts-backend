# OpenapiClient::BusinessProfileCustomHours

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **time_zone** | **String** | Timezone identifier | [optional] |
| **config** | [**Array&lt;BusinessHours&gt;**](BusinessHours.md) | Working hours configuration | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::BusinessProfileCustomHours.new(
  time_zone: Europe/Bucharest,
  config: null
)
```

