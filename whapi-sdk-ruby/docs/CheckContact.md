# OpenapiClient::CheckContact

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **input** | **String** | The value you sent in the contacts field of the JSON request. | [optional] |
| **status** | **String** | Status of the user. | [optional] |
| **wa_id** | **String** | WhatsApp user identifier that can be used in other API calls. Only returned if the status is valid. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::CheckContact.new(
  input: null,
  status: null,
  wa_id: null
)
```

