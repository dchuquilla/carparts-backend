# OpenapiClient::WebhookPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **contacts** | [**Array&lt;Contact&gt;**](Contact.md) | The contacts array contains all contacts that were sent to the webhook URL. Sent on event \&quot;contacts.post\&quot; | [optional] |
| **messages** | [**Array&lt;Message&gt;**](Message.md) | The messages array contains all messages that were sent to the webhook URL. Sent on event \&quot;messages.post\&quot; or \&quot;messages.put\&quot; | [optional] |
| **messages_updates** | [**Array&lt;MessageUpdate&gt;**](MessageUpdate.md) | The messages updates array contains all messages updates that were sent to the webhook URL. Sent on event \&quot;messages.patch\&quot; | [optional] |
| **messages_removed** | **Array&lt;String&gt;** | The messages removed array contains all messages removed that were sent to the webhook URL. Sent on event \&quot;messages.delete\&quot; | [optional] |
| **messages_removed_all** | **String** | The messages removed all contains the chat ID of the chat that was cleared. Sent on event \&quot;messages.delete\&quot; | [optional] |
| **statuses** | [**Array&lt;Status&gt;**](Status.md) | The messages statuses array contains all statuses that were sent to the webhook URL. Sent on event \&quot;statuses.post\&quot; or \&quot;statuses.put\&quot; | [optional] |
| **chats** | [**Array&lt;Chat&gt;**](Chat.md) | The chats array contains all chats that were sent to the webhook URL. Sent on event \&quot;chats.post\&quot; or \&quot;chats.put\&quot; | [optional] |
| **chats_updates** | [**Array&lt;ChatUpdate&gt;**](ChatUpdate.md) | The chats updates array contains all chats updates that were sent to the webhook URL. Sent on event \&quot;chats.patch\&quot; | [optional] |
| **chats_removed** | **Array&lt;String&gt;** | The chats removed array contains all chats removed that were sent to the webhook URL. Sent on event \&quot;chats.delete\&quot; | [optional] |
| **contacts_updates** | [**Array&lt;ContactUpdate&gt;**](ContactUpdate.md) | The contacts updates array contains all contacts updates that were sent to the webhook URL. Sent on event \&quot;contacts.patch\&quot; | [optional] |
| **groups** | [**Array&lt;Group&gt;**](Group.md) | The groups array contains all groups that were sent to the webhook URL. Sent on event \&quot;groups.post\&quot; | [optional] |
| **groups_participants** | [**Array&lt;ParticipantEvent&gt;**](ParticipantEvent.md) | The groups participants event array contains all groups participants event that were sent to the webhook URL. Sent on event \&quot;groups.put\&quot; | [optional] |
| **groups_updates** | [**Array&lt;GroupUpdate&gt;**](GroupUpdate.md) | The groups updates array contains all groups updates that were sent to the webhook URL. Sent on event \&quot;groups.patch\&quot; | [optional] |
| **presences** | [**Array&lt;Presence&gt;**](Presence.md) | The presences array contains all presences that were sent to the webhook URL. Sent on event \&quot;presences.post\&quot; | [optional] |
| **labels** | [**Array&lt;Label&gt;**](Label.md) | The labels array contains all labels that were sent to the webhook URL. Sent on event \&quot;labels.post\&quot; | [optional] |
| **labels_removed** | **Array&lt;String&gt;** | The labels removed array contains all labels removed that were sent to the webhook URL. Sent on event \&quot;labels.delete\&quot; | [optional] |
| **calls** | [**Array&lt;CallEvent&gt;**](CallEvent.md) | The calls array contains all calls that were sent to the webhook URL. Sent on event \&quot;calls.post\&quot; | [optional] |
| **qr** | [**QR**](QR.md) |  | [optional] |
| **health** | [**Health**](Health.md) |  | [optional] |
| **user** | [**Contact**](Contact.md) |  | [optional] |
| **errors** | [**Array&lt;Error&gt;**](Error.md) |  | [optional] |
| **event** | [**Event**](Event.md) |  | [optional] |
| **channel_id** | **String** | The channel ID | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::WebhookPayload.new(
  contacts: null,
  messages: null,
  messages_updates: null,
  messages_removed: null,
  messages_removed_all: 1234567890@s.whatsapp.net,
  statuses: null,
  chats: null,
  chats_updates: null,
  chats_removed: null,
  contacts_updates: null,
  groups: null,
  groups_participants: null,
  groups_updates: null,
  presences: null,
  labels: null,
  labels_removed: null,
  calls: null,
  qr: null,
  health: null,
  user: null,
  errors: null,
  event: null,
  channel_id: SUPERMAN-f75
)
```

