# OpenapiClient::Message

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Message ID |  |
| **type** | [**MessageType**](MessageType.md) |  | [default to &#39;text&#39;] |
| **subtype** | **String** | Message subtype | [optional] |
| **chat_id** | **String** | Chat ID |  |
| **chat_name** | **String** | Chat name | [optional] |
| **from** | **String** | WhatsApp ID of the sender | [optional] |
| **from_me** | **Boolean** | Is message from me |  |
| **from_name** | **String** | Pushname of the sender | [optional] |
| **source** | [**MessageSource**](MessageSource.md) |  | [optional][default to &#39;text&#39;] |
| **timestamp** | **Float** | Message timestamp |  |
| **device_id** | **Float** | Device ID, if the message was not sent through the app | [optional] |
| **status** | [**StatusEnum**](StatusEnum.md) |  | [optional] |
| **text** | [**MessageContentText**](MessageContentText.md) |  | [optional] |
| **image** | [**MessageContentImage**](MessageContentImage.md) |  | [optional] |
| **video** | [**MessageContentVideo**](MessageContentVideo.md) |  | [optional] |
| **short** | [**MessageContentVideo**](MessageContentVideo.md) |  | [optional] |
| **gif** | [**MessageContentVideo**](MessageContentVideo.md) |  | [optional] |
| **audio** | [**MessageContentAudio**](MessageContentAudio.md) |  | [optional] |
| **voice** | [**MessageContentAudio**](MessageContentAudio.md) |  | [optional] |
| **document** | [**MessageContentDocument**](MessageContentDocument.md) |  | [optional] |
| **link_preview** | [**MessageContentLinkPreview**](MessageContentLinkPreview.md) |  | [optional] |
| **sticker** | [**MessageContentSticker**](MessageContentSticker.md) |  | [optional] |
| **location** | [**MessageContentLocation**](MessageContentLocation.md) |  | [optional] |
| **live_location** | [**MessageContentLiveLocation**](MessageContentLiveLocation.md) |  | [optional] |
| **contact** | [**MessageContentContact**](MessageContentContact.md) |  | [optional] |
| **contact_list** | [**MessageContentContacts**](MessageContentContacts.md) |  | [optional] |
| **interactive** | [**MessageContentInteractive**](MessageContentInteractive.md) |  | [optional] |
| **poll** | [**MessageContentPoll**](MessageContentPoll.md) |  | [optional] |
| **hsm** | [**MessageContentHSM**](MessageContentHSM.md) |  | [optional] |
| **system** | [**MessageContentSystem**](MessageContentSystem.md) |  | [optional] |
| **order** | [**MessageContentOrder**](MessageContentOrder.md) |  | [optional] |
| **group_invite** | [**MessageContentLinkPreview**](MessageContentLinkPreview.md) |  | [optional] |
| **newsletter_invite** | [**MessageContentLinkPreview**](MessageContentLinkPreview.md) |  | [optional] |
| **admin_invite** | [**MessageContentNewsletterAdminInvite**](MessageContentNewsletterAdminInvite.md) |  | [optional] |
| **product** | [**MessageContentProduct**](MessageContentProduct.md) |  | [optional] |
| **catalog** | [**MessageContentLinkPreview**](MessageContentLinkPreview.md) |  | [optional] |
| **product_items** | [**MessageContentProductItems**](MessageContentProductItems.md) |  | [optional] |
| **action** | [**MessageAction**](MessageAction.md) |  | [optional] |
| **context** | [**MessageContext**](MessageContext.md) |  | [optional] |
| **event** | [**MessageContentEvent**](MessageContentEvent.md) |  | [optional] |
| **list** | [**MessageContentList**](MessageContentList.md) |  | [optional] |
| **buttons** | [**MessageContentButtons**](MessageContentButtons.md) |  | [optional] |
| **reactions** | [**Array&lt;MessageReaction&gt;**](MessageReaction.md) | Reactions for message | [optional] |
| **labels** | [**Array&lt;Label&gt;**](Label.md) | Labels associated with message | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Message.new(
  id: null,
  type: null,
  subtype: null,
  chat_id: null,
  chat_name: null,
  from: null,
  from_me: null,
  from_name: null,
  source: null,
  timestamp: null,
  device_id: null,
  status: null,
  text: null,
  image: null,
  video: null,
  short: null,
  gif: null,
  audio: null,
  voice: null,
  document: null,
  link_preview: null,
  sticker: null,
  location: null,
  live_location: null,
  contact: null,
  contact_list: null,
  interactive: null,
  poll: null,
  hsm: null,
  system: null,
  order: null,
  group_invite: null,
  newsletter_invite: null,
  admin_invite: null,
  product: null,
  catalog: null,
  product_items: null,
  action: null,
  context: null,
  event: null,
  list: null,
  buttons: null,
  reactions: null,
  labels: null
)
```

