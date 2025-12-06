# OpenapiClient::WebhookParameters

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **headers** | **Hash&lt;String, String&gt;** | Additional headers for webhook. Max 5 headers. &lt;br/&gt;Example: &lt;br/&gt;\&quot;Authorization - Bearer token\&quot; &lt;br/&gt;\&quot;Content-Type - application/json\&quot; &lt;br/&gt;\&quot;X-Header - value\&quot; | [optional] |
| **url** | **String** | Inbound and outbound notifications are routed to this URL. | [optional] |
| **mode** | **String** | Request method for sending hook. | [optional][default to &#39;body&#39;] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::WebhookParameters.new(
  headers: null,
  url: null,
  mode: null
)
```

