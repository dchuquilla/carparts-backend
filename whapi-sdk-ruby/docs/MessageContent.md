# OpenapiClient::MessageContent

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'openapi_client'

OpenapiClient::MessageContent.openapi_one_of
# =>
# [
#   :'MessageContentAudio',
#   :'MessageContentContact',
#   :'MessageContentContacts',
#   :'MessageContentDocument',
#   :'MessageContentImage',
#   :'MessageContentInteractive',
#   :'MessageContentLinkPreview',
#   :'MessageContentLiveLocation',
#   :'MessageContentLocation',
#   :'MessageContentNewsletterAdminInvite',
#   :'MessageContentPoll',
#   :'MessageContentProduct',
#   :'MessageContentReply',
#   :'MessageContentSticker',
#   :'MessageContentText',
#   :'MessageContentVideo'
# ]
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'openapi_client'

OpenapiClient::MessageContent.build(data)
# => #<MessageContentAudio:0x00007fdd4aab02a0>

OpenapiClient::MessageContent.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `MessageContentAudio`
- `MessageContentContact`
- `MessageContentContacts`
- `MessageContentDocument`
- `MessageContentImage`
- `MessageContentInteractive`
- `MessageContentLinkPreview`
- `MessageContentLiveLocation`
- `MessageContentLocation`
- `MessageContentNewsletterAdminInvite`
- `MessageContentPoll`
- `MessageContentProduct`
- `MessageContentReply`
- `MessageContentSticker`
- `MessageContentText`
- `MessageContentVideo`
- `nil` (if no type matches)

