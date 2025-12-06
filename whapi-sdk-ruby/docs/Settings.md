# OpenapiClient::Settings

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **callback_backoff_delay_ms** | **Float** | Backoff delay for a failed callback in milliseconds This setting is used to configure the amount of time the backoff delays before retrying a failed callback. The backoff delay increases linearly by this value each time a callback fails to get a HTTPS 200 OK response. The backoff delay is capped by the max_callback_backoff_delay_ms setting. | [optional] |
| **max_callback_backoff_delay_ms** | **Float** | Maximum delay for a failed callback in milliseconds | [optional] |
| **callback_persist** | **Boolean** | Stores callbacks on disk until they are successfully acknowledged by the Webhook or not. Restart required. | [optional] |
| **media** | [**MediaSettings**](MediaSettings.md) |  | [optional] |
| **webhooks** | [**Array&lt;Webhook&gt;**](Webhook.md) |  | [optional] |
| **proxy** | **String** | Use your Socks5 proxy if your account activity arouses suspicion from WhatsApp. This can help maintain anonymity and ensure smooth operation. | [optional] |
| **mobile_proxy** | **String** | Service proxy for mobile authorization. | [optional] |
| **offline_mode** | **Boolean** | When true, API will not send online status to the server on connection. This will allow you to receive push notifications to devices connected to the number. Working after reconnect. | [optional][default to false] |
| **full_history** | **Boolean** | When true, all messages will be cached after the connection. If false, old messages will selectively not be cached, allowing large accounts to run faster. Working after reconnect. | [optional][default to false] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Settings.new(
  callback_backoff_delay_ms: null,
  max_callback_backoff_delay_ms: null,
  callback_persist: null,
  media: null,
  webhooks: null,
  proxy: null,
  mobile_proxy: null,
  offline_mode: null,
  full_history: null
)
```

