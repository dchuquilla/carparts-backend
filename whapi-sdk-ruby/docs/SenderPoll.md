# OpenapiClient::SenderPoll

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **to** | **String** | Use the phone number or [Chat ID](https://support.whapi.cloud/help-desk/faq/chat-id.-what-is-it-and-how-to-get-it) of the contact/group/channel to which you want to send the message. Use [Get groups](https://whapi.readme.io/reference/getgroups) to get the group ID. |  |
| **quoted** | **String** | Message ID of the message to be quoted | [optional] |
| **ephemeral** | **Integer** | Time in seconds for the message to be deleted. The Disappearing messages setting should be enabled in the chat where you are sending this message. | [optional] |
| **edit** | **String** | Message ID of the message to be edited | [optional] |
| **title** | **String** | Title of poll |  |
| **options** | **Array&lt;String&gt;** | Options of poll |  |
| **count** | **Integer** | Number of selectable options in poll (1 - can choose only one option, 0 - any number of options) | [optional] |
| **view_once** | **Boolean** | Is view once | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::SenderPoll.new(
  to: 1234567891@s.whatsapp.net,
  quoted: null,
  ephemeral: null,
  edit: null,
  title: null,
  options: null,
  count: null,
  view_once: null
)
```

