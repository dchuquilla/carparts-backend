# OpenapiClient::SenderInteractive

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **to** | **String** | Use the phone number or [Chat ID](https://support.whapi.cloud/help-desk/faq/chat-id.-what-is-it-and-how-to-get-it) of the contact/group/channel to which you want to send the message. Use [Get groups](https://whapi.readme.io/reference/getgroups) to get the group ID. |  |
| **quoted** | **String** | Message ID of the message to be quoted | [optional] |
| **ephemeral** | **Integer** | Time in seconds for the message to be deleted. The Disappearing messages setting should be enabled in the chat where you are sending this message. | [optional] |
| **edit** | **String** | Message ID of the message to be edited | [optional] |
| **header** | [**MessagePropsInteractiveHeader**](MessagePropsInteractiveHeader.md) |  | [optional] |
| **body** | [**MessagePropsInteractiveBody**](MessagePropsInteractiveBody.md) |  | [optional] |
| **footer** | [**MessagePropsInteractiveFooter**](MessagePropsInteractiveFooter.md) |  | [optional] |
| **action** | [**InteractiveAction**](InteractiveAction.md) |  |  |
| **type** | [**InteractiveType**](InteractiveType.md) |  | [optional][default to &#39;button&#39;] |
| **view_once** | **Boolean** | Is view once | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::SenderInteractive.new(
  to: 1234567891@s.whatsapp.net,
  quoted: null,
  ephemeral: null,
  edit: null,
  header: null,
  body: null,
  footer: null,
  action: null,
  type: null,
  view_once: null
)
```

