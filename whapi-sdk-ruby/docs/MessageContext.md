# OpenapiClient::MessageContext

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **forwarded** | **Boolean** | Is forwarding message | [optional] |
| **forwarding_score** | **Integer** | Count fo forwarding message | [optional] |
| **mentions** | **Array&lt;String&gt;** | The numbers of the mentioned users | [optional] |
| **ad** | [**MessageContextAD**](MessageContextAD.md) |  | [optional] |
| **conversion** | [**MessageContextConversion**](MessageContextConversion.md) |  | [optional] |
| **quoted_id** | **String** | ID of quoted message | [optional] |
| **quoted_type** | [**MessageType**](MessageType.md) |  | [optional][default to &#39;text&#39;] |
| **quoted_content** | [**MessageContent**](MessageContent.md) |  | [optional] |
| **quoted_author** | **String** | Whatsapp ID of quoted message author | [optional] |
| **ephemeral** | **Integer** | Ephemeral message duration | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessageContext.new(
  forwarded: null,
  forwarding_score: null,
  mentions: null,
  ad: null,
  conversion: null,
  quoted_id: null,
  quoted_type: null,
  quoted_content: null,
  quoted_author: null,
  ephemeral: null
)
```

