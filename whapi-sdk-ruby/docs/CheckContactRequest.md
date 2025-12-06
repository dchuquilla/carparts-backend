# OpenapiClient::CheckContactRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **blocking** | **String** | Blocking determines whether the request should wait for the processing to complete (synchronous) or not (asynchronous). | [optional][default to &#39;no_wait&#39;] |
| **contacts** | **Array&lt;String&gt;** | Array of contact phone numbers. The numbers can be in any standard telephone number format. |  |
| **force_check** | **Boolean** | Force check determines whether the request should check the contact even if it is already in the cache. | [optional][default to false] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::CheckContactRequest.new(
  blocking: null,
  contacts: null,
  force_check: null
)
```

