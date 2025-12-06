# OpenapiClient::MessagesApi

All URIs are relative to *https://gate.whapi.cloud*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**delete_message**](MessagesApi.md#delete_message) | **DELETE** /messages/{MessageID} | ❌ Delete message |
| [**forward_message**](MessagesApi.md#forward_message) | **POST** /messages/{MessageID} | ↪ Forward message |
| [**get_message**](MessagesApi.md#get_message) | **GET** /messages/{MessageID} | Get message |
| [**get_messages**](MessagesApi.md#get_messages) | **GET** /messages/list | Get messages |
| [**get_messages_by_chat_id**](MessagesApi.md#get_messages_by_chat_id) | **GET** /messages/list/{ChatID} | Get messages by chat ID |
| [**mark_message_as_read**](MessagesApi.md#mark_message_as_read) | **PUT** /messages/{MessageID} | ✔✔ Mark message as read |
| [**pin_message**](MessagesApi.md#pin_message) | **POST** /messages/{MessageID}/pin | 📌 Pin message |
| [**react_to_message**](MessagesApi.md#react_to_message) | **PUT** /messages/{MessageID}/reaction | 😍 React to message |
| [**send_media_message**](MessagesApi.md#send_media_message) | **POST** /messages/media/{MediaMessageType} | 📎 Send media message |
| [**send_message_audio**](MessagesApi.md#send_message_audio) | **POST** /messages/audio | 🎵 Send media-audio message |
| [**send_message_contact**](MessagesApi.md#send_message_contact) | **POST** /messages/contact | 👤 Send contact message |
| [**send_message_contact_list**](MessagesApi.md#send_message_contact_list) | **POST** /messages/contact_list | 👥 Send contact list message |
| [**send_message_document**](MessagesApi.md#send_message_document) | **POST** /messages/document | 📑 Send media-document message |
| [**send_message_gif**](MessagesApi.md#send_message_gif) | **POST** /messages/gif | 🎬 Send media-gif message |
| [**send_message_image**](MessagesApi.md#send_message_image) | **POST** /messages/image | 🖼 Send media-image message |
| [**send_message_interactive**](MessagesApi.md#send_message_interactive) | **POST** /messages/interactive | 🎮 Send interactive message |
| [**send_message_link_preview**](MessagesApi.md#send_message_link_preview) | **POST** /messages/link_preview | 📎 Send link preview message |
| [**send_message_live_location**](MessagesApi.md#send_message_live_location) | **POST** /messages/live_location | 🧭 Send live location message |
| [**send_message_location**](MessagesApi.md#send_message_location) | **POST** /messages/location | 📍 Send location message |
| [**send_message_poll**](MessagesApi.md#send_message_poll) | **POST** /messages/poll | 📊 Send poll message |
| [**send_message_short**](MessagesApi.md#send_message_short) | **POST** /messages/short | 📹 Send media-short video message (PTV) |
| [**send_message_sticker**](MessagesApi.md#send_message_sticker) | **POST** /messages/sticker | 🎭 Send media-sticker message |
| [**send_message_story**](MessagesApi.md#send_message_story) | **POST** /messages/story | 👁️‍🗨️ Send story message |
| [**send_message_story_audio**](MessagesApi.md#send_message_story_audio) | **POST** /messages/story/audio | 🎵️ Send story audio message |
| [**send_message_story_media**](MessagesApi.md#send_message_story_media) | **POST** /messages/story/media | 🖼 Send story media message |
| [**send_message_story_text**](MessagesApi.md#send_message_story_text) | **POST** /messages/story/text | 💬 Send story text message |
| [**send_message_text**](MessagesApi.md#send_message_text) | **POST** /messages/text | 💬 Send text message |
| [**send_message_video**](MessagesApi.md#send_message_video) | **POST** /messages/video | 🎥 Send media-video message |
| [**send_message_voice**](MessagesApi.md#send_message_voice) | **POST** /messages/voice | 🎤 Send media-voice message |
| [**star_message**](MessagesApi.md#star_message) | **PUT** /messages/{MessageID}/star | ⭐ Star message |
| [**unpin_message**](MessagesApi.md#unpin_message) | **DELETE** /messages/{MessageID}/pin | Unpin message |


## delete_message

> <ResponseSuccess> delete_message(message_id)

❌ Delete message

Method used to delete a text sent in a chat. You will be able to delete a message that you sent as well as a message that was sent by a contact. To use this resource you will only need the messageId of the message that you want to delete.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
message_id = 'message_id_example' # String | Message ID

begin
  # ❌ Delete message
  result = api_instance.delete_message(message_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->delete_message: #{e}"
end
```

#### Using the delete_message_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> delete_message_with_http_info(message_id)

```ruby
begin
  # ❌ Delete message
  data, status_code, headers = api_instance.delete_message_with_http_info(message_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->delete_message_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **message_id** | **String** | Message ID |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## forward_message

> <SentMessage> forward_message(message_id, forward_message)

↪ Forward message

Simple and straightforward, in this method, you can forward messages through the API by providing the messageId of the message you want to forward and the phone number of the chat where this messageId is located.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
message_id = 'message_id_example' # String | Message ID
forward_message = OpenapiClient::ForwardMessage.new({to: 'to_example'}) # ForwardMessage | Forward message

begin
  # ↪ Forward message
  result = api_instance.forward_message(message_id, forward_message)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->forward_message: #{e}"
end
```

#### Using the forward_message_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> forward_message_with_http_info(message_id, forward_message)

```ruby
begin
  # ↪ Forward message
  data, status_code, headers = api_instance.forward_message_with_http_info(message_id, forward_message)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->forward_message_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **message_id** | **String** | Message ID |  |
| **forward_message** | [**ForwardMessage**](ForwardMessage.md) | Forward message |  |

### Return type

[**SentMessage**](SentMessage.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_message

> <Message> get_message(message_id)

Get message

The method returns a message from any chat by message id.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
message_id = 'message_id_example' # String | Message ID

begin
  # Get message
  result = api_instance.get_message(message_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->get_message: #{e}"
end
```

#### Using the get_message_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Message>, Integer, Hash)> get_message_with_http_info(message_id)

```ruby
begin
  # Get message
  data, status_code, headers = api_instance.get_message_with_http_info(message_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Message>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->get_message_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **message_id** | **String** | Message ID |  |

### Return type

[**Message**](Message.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_messages

> <MessagesList> get_messages(opts)

Get messages

The method contains a list of all received and sent messages in a particular chat. Sorting by descending date of message sending.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
opts = {
  count: 8.14, # Float | Count of objects to return
  offset: 8.14, # Float | Offset of objects to return
  time_from: 8.14, # Float | Timestamp from which to get objects
  time_to: 8.14, # Float | Timestamp up to which to get objects
  normal_types: true, # Boolean | If false, include system messages
  author: 'author_example', # String | To filter by author (Contact ID)
  from_me: true, # Boolean | If true, only return messages sent by the authenticated user. If false, only return messages sent by other users.
  sort: 'asc' # String | Order for items in request
}

begin
  # Get messages
  result = api_instance.get_messages(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->get_messages: #{e}"
end
```

#### Using the get_messages_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<MessagesList>, Integer, Hash)> get_messages_with_http_info(opts)

```ruby
begin
  # Get messages
  data, status_code, headers = api_instance.get_messages_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <MessagesList>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->get_messages_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **count** | **Float** | Count of objects to return | [optional][default to 100] |
| **offset** | **Float** | Offset of objects to return | [optional] |
| **time_from** | **Float** | Timestamp from which to get objects | [optional] |
| **time_to** | **Float** | Timestamp up to which to get objects | [optional] |
| **normal_types** | **Boolean** | If false, include system messages | [optional] |
| **author** | **String** | To filter by author (Contact ID) | [optional] |
| **from_me** | **Boolean** | If true, only return messages sent by the authenticated user. If false, only return messages sent by other users. | [optional] |
| **sort** | **String** | Order for items in request | [optional] |

### Return type

[**MessagesList**](MessagesList.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_messages_by_chat_id

> <MessagesList> get_messages_by_chat_id(chat_id, opts)

Get messages by chat ID

The method contains a list of all received and sent messages in a particular chat. Sorting by descending date of message sending. You will need to specify [Chat ID](https://support.whapi.cloud/help-desk/faq/chat-id.-what-is-it-and-how-to-get-it)

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
chat_id = 'chat_id_example' # String | Chat ID
opts = {
  count: 8.14, # Float | Count of objects to return
  offset: 8.14, # Float | Offset of objects to return
  time_from: 8.14, # Float | Timestamp from which to get objects
  time_to: 8.14, # Float | Timestamp up to which to get objects
  normal_types: true, # Boolean | If false, include system messages
  author: 'author_example', # String | To filter by author (Contact ID)
  from_me: true, # Boolean | If true, only return messages sent by the authenticated user. If false, only return messages sent by other users.
  sort: 'asc' # String | Order for items in request
}

begin
  # Get messages by chat ID
  result = api_instance.get_messages_by_chat_id(chat_id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->get_messages_by_chat_id: #{e}"
end
```

#### Using the get_messages_by_chat_id_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<MessagesList>, Integer, Hash)> get_messages_by_chat_id_with_http_info(chat_id, opts)

```ruby
begin
  # Get messages by chat ID
  data, status_code, headers = api_instance.get_messages_by_chat_id_with_http_info(chat_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <MessagesList>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->get_messages_by_chat_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **chat_id** | **String** | Chat ID |  |
| **count** | **Float** | Count of objects to return | [optional][default to 100] |
| **offset** | **Float** | Offset of objects to return | [optional] |
| **time_from** | **Float** | Timestamp from which to get objects | [optional] |
| **time_to** | **Float** | Timestamp up to which to get objects | [optional] |
| **normal_types** | **Boolean** | If false, include system messages | [optional] |
| **author** | **String** | To filter by author (Contact ID) | [optional] |
| **from_me** | **Boolean** | If true, only return messages sent by the authenticated user. If false, only return messages sent by other users. | [optional] |
| **sort** | **String** | Order for items in request | [optional] |

### Return type

[**MessagesList**](MessagesList.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## mark_message_as_read

> <ResponseSuccess> mark_message_as_read(message_id)

✔✔ Mark message as read

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
message_id = 'message_id_example' # String | Message ID

begin
  # ✔✔ Mark message as read
  result = api_instance.mark_message_as_read(message_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->mark_message_as_read: #{e}"
end
```

#### Using the mark_message_as_read_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> mark_message_as_read_with_http_info(message_id)

```ruby
begin
  # ✔✔ Mark message as read
  data, status_code, headers = api_instance.mark_message_as_read_with_http_info(message_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->mark_message_as_read_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **message_id** | **String** | Message ID |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## pin_message

> <ResponseSuccess> pin_message(message_id, pin)

📌 Pin message

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
message_id = 'message_id_example' # String | Message ID
pin = OpenapiClient::Pin.new # Pin | Star message

begin
  # 📌 Pin message
  result = api_instance.pin_message(message_id, pin)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->pin_message: #{e}"
end
```

#### Using the pin_message_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> pin_message_with_http_info(message_id, pin)

```ruby
begin
  # 📌 Pin message
  data, status_code, headers = api_instance.pin_message_with_http_info(message_id, pin)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->pin_message_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **message_id** | **String** | Message ID |  |
| **pin** | [**Pin**](Pin.md) | Star message |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## react_to_message

> <ResponseSuccess> react_to_message(message_id, react_to_message)

😍 React to message

In this method you will be able to react to messages that were sent or recieved by you. You will need to specify the ID of the message you will respond to, as well as [the emoji](https://support.whapi.cloud/help-desk/sending/send-emoji)

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
message_id = 'message_id_example' # String | Message ID
react_to_message = OpenapiClient::ReactToMessage.new({emoji: 'emoji_example'}) # ReactToMessage | React to message

begin
  # 😍 React to message
  result = api_instance.react_to_message(message_id, react_to_message)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->react_to_message: #{e}"
end
```

#### Using the react_to_message_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> react_to_message_with_http_info(message_id, react_to_message)

```ruby
begin
  # 😍 React to message
  data, status_code, headers = api_instance.react_to_message_with_http_info(message_id, react_to_message)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->react_to_message_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **message_id** | **String** | Message ID |  |
| **react_to_message** | [**ReactToMessage**](ReactToMessage.md) | React to message |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## send_media_message

> <SentMessage> send_media_message(media_message_type, send_params, body)

📎 Send media message

Additional endpoint for easy send media-file as message. Use request body as file and inpath parameters for send parameters. Media message can be one of the following types: - 📷 image - 🎥 video - 🎬 gif - 🎵 audio - 🎤 voice - 📄 document - 🎭 sticker 

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
media_message_type = OpenapiClient::MediaMessageType::IMAGE # MediaMessageType | Media message type
send_params = { ... } # SenderMedia | Send sender parameters via query
body = File.new('/path/to/some/file') # File | 

begin
  # 📎 Send media message
  result = api_instance.send_media_message(media_message_type, send_params, body)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_media_message: #{e}"
end
```

#### Using the send_media_message_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> send_media_message_with_http_info(media_message_type, send_params, body)

```ruby
begin
  # 📎 Send media message
  data, status_code, headers = api_instance.send_media_message_with_http_info(media_message_type, send_params, body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_media_message_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **media_message_type** | [**MediaMessageType**](.md) | Media message type |  |
| **send_params** | [**SenderMedia**](.md) | Send sender parameters via query |  |
| **body** | **File** |  |  |

### Return type

[**SentMessage**](SentMessage.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/pdf, application/msword, application/vnd.ms-powerpoint, application/vnd.ms-excel, text/plain, image/jpeg, image/png, audio/acc, audio/mp4, audio/amr, audio/mpeg, audio/ogg, codecs=opus, video/mp4, application/json
- **Accept**: application/json


## send_message_audio

> <SentMessage> send_message_audio(sender_audio)

🎵 Send media-audio message

This method is responsible for sending audio messages for chats. The requirements for [sending all media types are identical](https://support.whapi.cloud/help-desk/sending/send-video-audio-image-document)

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
sender_audio = OpenapiClient::SenderAudio.new({to: '1234567891@s.whatsapp.net', media: nil}) # SenderAudio | Message audio

begin
  # 🎵 Send media-audio message
  result = api_instance.send_message_audio(sender_audio)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_audio: #{e}"
end
```

#### Using the send_message_audio_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> send_message_audio_with_http_info(sender_audio)

```ruby
begin
  # 🎵 Send media-audio message
  data, status_code, headers = api_instance.send_message_audio_with_http_info(sender_audio)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_audio_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sender_audio** | [**SenderAudio**](SenderAudio.md) | Message audio |  |

### Return type

[**SentMessage**](SentMessage.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## send_message_contact

> <SentMessage> send_message_contact(sender_contact)

👤 Send contact message

Simple and object, this method allows you to send a contact. You don't need to have it added to your contacts list, all you have to do is fill in the method attributes with the contact information and send. [A few ready examples](https://support.whapi.cloud/help-desk/sending/overview-of-other-methods-for-sending/send-contact-vcard)

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
sender_contact = OpenapiClient::SenderContact.new({to: '1234567891@s.whatsapp.net', name: 'name_example', vcard: 'vcard_example'}) # SenderContact | Message contact

begin
  # 👤 Send contact message
  result = api_instance.send_message_contact(sender_contact)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_contact: #{e}"
end
```

#### Using the send_message_contact_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> send_message_contact_with_http_info(sender_contact)

```ruby
begin
  # 👤 Send contact message
  data, status_code, headers = api_instance.send_message_contact_with_http_info(sender_contact)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_contact_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sender_contact** | [**SenderContact**](SenderContact.md) | Message contact |  |

### Return type

[**SentMessage**](SentMessage.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## send_message_contact_list

> <SentMessage> send_message_contact_list(sender_contact_list)

👥 Send contact list message

Simple and straightforward, this method allows you to send multiple contacts. You don't need to have them in your contacts; just fill the method's attributes with the contact information and send. [A few ready examples](https://support.whapi.cloud/help-desk/sending/overview-of-other-methods-for-sending/send-contact-vcard)

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
sender_contact_list = OpenapiClient::SenderContactList.new({to: '1234567891@s.whatsapp.net', list: [OpenapiClient::VCard.new]}) # SenderContactList | Message contact list

begin
  # 👥 Send contact list message
  result = api_instance.send_message_contact_list(sender_contact_list)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_contact_list: #{e}"
end
```

#### Using the send_message_contact_list_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> send_message_contact_list_with_http_info(sender_contact_list)

```ruby
begin
  # 👥 Send contact list message
  data, status_code, headers = api_instance.send_message_contact_list_with_http_info(sender_contact_list)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_contact_list_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sender_contact_list** | [**SenderContactList**](SenderContactList.md) | Message contact list |  |

### Return type

[**SentMessage**](SentMessage.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## send_message_document

> <SentMessage> send_message_document(sender_document)

📑 Send media-document message

This method is responsible for sending documents for chats. The requirements for [sending all media types are identical](https://support.whapi.cloud/help-desk/sending/send-video-audio-image-document)

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
sender_document = OpenapiClient::SenderDocument.new({to: '1234567891@s.whatsapp.net', media: nil}) # SenderDocument | Message document

begin
  # 📑 Send media-document message
  result = api_instance.send_message_document(sender_document)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_document: #{e}"
end
```

#### Using the send_message_document_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> send_message_document_with_http_info(sender_document)

```ruby
begin
  # 📑 Send media-document message
  data, status_code, headers = api_instance.send_message_document_with_http_info(sender_document)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_document_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sender_document** | [**SenderDocument**](SenderDocument.md) | Message document |  |

### Return type

[**SentMessage**](SentMessage.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## send_message_gif

> <SentMessage> send_message_gif(sender_gif)

🎬 Send media-gif message

Method responsible for sending GIFs to your chats through the API (The file to be sent must be an MP4)

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
sender_gif = OpenapiClient::SenderGif.new({to: '1234567891@s.whatsapp.net', media: nil}) # SenderGif | Message gif

begin
  # 🎬 Send media-gif message
  result = api_instance.send_message_gif(sender_gif)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_gif: #{e}"
end
```

#### Using the send_message_gif_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> send_message_gif_with_http_info(sender_gif)

```ruby
begin
  # 🎬 Send media-gif message
  data, status_code, headers = api_instance.send_message_gif_with_http_info(sender_gif)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_gif_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sender_gif** | [**SenderGif**](SenderGif.md) | Message gif |  |

### Return type

[**SentMessage**](SentMessage.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## send_message_image

> <SentMessage> send_message_image(sender_image)

🖼 Send media-image message

This method is responsible for sending images for chats. The requirements for [sending all media types are identical](https://support.whapi.cloud/help-desk/sending/send-video-audio-image-document)

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
sender_image = OpenapiClient::SenderImage.new({to: '1234567891@s.whatsapp.net', media: nil}) # SenderImage | Message image

begin
  # 🖼 Send media-image message
  result = api_instance.send_message_image(sender_image)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_image: #{e}"
end
```

#### Using the send_message_image_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> send_message_image_with_http_info(sender_image)

```ruby
begin
  # 🖼 Send media-image message
  data, status_code, headers = api_instance.send_message_image_with_http_info(sender_image)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_image_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sender_image** | [**SenderImage**](SenderImage.md) | Message image |  |

### Return type

[**SentMessage**](SentMessage.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## send_message_interactive

> <SentMessage> send_message_interactive(sender_interactive)

🎮 Send interactive message

This endpoint is responsible for sending messages with buttons. The section is constantly updated as the functionality of buttons depends on WhatsApp updates. Attention! The functionality of sending messages with buttons is not stable! For more information, please visit the [Button Status topic](https://support.whapi.cloud/help-desk/faq/current-status-of-buttons-on-whatsapp).

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
sender_interactive = OpenapiClient::SenderInteractive.new({to: '1234567891@s.whatsapp.net', action: OpenapiClient::InteractiveAction.new}) # SenderInteractive | Message interactive

begin
  # 🎮 Send interactive message
  result = api_instance.send_message_interactive(sender_interactive)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_interactive: #{e}"
end
```

#### Using the send_message_interactive_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> send_message_interactive_with_http_info(sender_interactive)

```ruby
begin
  # 🎮 Send interactive message
  data, status_code, headers = api_instance.send_message_interactive_with_http_info(sender_interactive)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_interactive_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sender_interactive** | [**SenderInteractive**](SenderInteractive.md) | Message interactive |  |

### Return type

[**SentMessage**](SentMessage.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## send_message_link_preview

> <SentMessage> send_message_link_preview(sender_link_preview)

📎 Send link preview message

Method responsible for sending links with customize preview to your contacts, it is used to share links so that the user can be redirected to a website. Your link must necessarily be in the Body parameter. It is important for you to know that [the link is only clickable](https://support.whapi.cloud/help-desk/faq/inactive-links-in-whatsapp-messages) if the recipient already has your phone number in their contacts, or if they start a conversation with you

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
sender_link_preview = OpenapiClient::SenderLinkPreview.new({to: '1234567891@s.whatsapp.net', body: 'body_example', title: 'title_example'}) # SenderLinkPreview | Message link preview send parameters

begin
  # 📎 Send link preview message
  result = api_instance.send_message_link_preview(sender_link_preview)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_link_preview: #{e}"
end
```

#### Using the send_message_link_preview_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> send_message_link_preview_with_http_info(sender_link_preview)

```ruby
begin
  # 📎 Send link preview message
  data, status_code, headers = api_instance.send_message_link_preview_with_http_info(sender_link_preview)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_link_preview_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sender_link_preview** | [**SenderLinkPreview**](SenderLinkPreview.md) | Message link preview send parameters |  |

### Return type

[**SentMessage**](SentMessage.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## send_message_live_location

> <SentMessage> send_message_live_location(sender_live_location)

🧭 Send live location message

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
sender_live_location = OpenapiClient::SenderLiveLocation.new({to: '1234567891@s.whatsapp.net', latitude: 3.56, longitude: 3.56}) # SenderLiveLocation | Message live location

begin
  # 🧭 Send live location message
  result = api_instance.send_message_live_location(sender_live_location)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_live_location: #{e}"
end
```

#### Using the send_message_live_location_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> send_message_live_location_with_http_info(sender_live_location)

```ruby
begin
  # 🧭 Send live location message
  data, status_code, headers = api_instance.send_message_live_location_with_http_info(sender_live_location)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_live_location_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sender_live_location** | [**SenderLiveLocation**](SenderLiveLocation.md) | Message live location |  |

### Return type

[**SentMessage**](SentMessage.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## send_message_location

> <SentMessage> send_message_location(sender_location)

📍 Send location message

Method responsible for sending a fixed location to your contacts, it is mostly used to send an address’s location

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
sender_location = OpenapiClient::SenderLocation.new({to: '1234567891@s.whatsapp.net', latitude: 3.56, longitude: 3.56}) # SenderLocation | Message location

begin
  # 📍 Send location message
  result = api_instance.send_message_location(sender_location)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_location: #{e}"
end
```

#### Using the send_message_location_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> send_message_location_with_http_info(sender_location)

```ruby
begin
  # 📍 Send location message
  data, status_code, headers = api_instance.send_message_location_with_http_info(sender_location)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_location_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sender_location** | [**SenderLocation**](SenderLocation.md) | Message location |  |

### Return type

[**SentMessage**](SentMessage.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## send_message_poll

> <SentMessage> send_message_poll(sender_poll)

📊 Send poll message

In this method, you can send poll-type messages. Often, it's the polls that replace [the buttons for interactive communication](https://support.whapi.cloud/help-desk/hints/how-to-use-polls-as-buttons)

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
sender_poll = OpenapiClient::SenderPoll.new({to: '1234567891@s.whatsapp.net', title: 'title_example', options: ['options_example']}) # SenderPoll | Message poll

begin
  # 📊 Send poll message
  result = api_instance.send_message_poll(sender_poll)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_poll: #{e}"
end
```

#### Using the send_message_poll_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> send_message_poll_with_http_info(sender_poll)

```ruby
begin
  # 📊 Send poll message
  data, status_code, headers = api_instance.send_message_poll_with_http_info(sender_poll)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_poll_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sender_poll** | [**SenderPoll**](SenderPoll.md) | Message poll |  |

### Return type

[**SentMessage**](SentMessage.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## send_message_short

> <SentMessage> send_message_short(sender_short)

📹 Send media-short video message (PTV)

This method is responsible for sending a short video in the circle for chats. The requirements for [sending all media types are identical](https://support.whapi.cloud/help-desk/sending/send-video-audio-image-document)

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
sender_short = OpenapiClient::SenderShort.new({to: '1234567891@s.whatsapp.net', media: nil}) # SenderShort | Message short

begin
  # 📹 Send media-short video message (PTV)
  result = api_instance.send_message_short(sender_short)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_short: #{e}"
end
```

#### Using the send_message_short_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> send_message_short_with_http_info(sender_short)

```ruby
begin
  # 📹 Send media-short video message (PTV)
  data, status_code, headers = api_instance.send_message_short_with_http_info(sender_short)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_short_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sender_short** | [**SenderShort**](SenderShort.md) | Message short |  |

### Return type

[**SentMessage**](SentMessage.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## send_message_sticker

> <SentMessage> send_message_sticker(sender_sticker)

🎭 Send media-sticker message

This method is responsible for sending a sticker message for chats. The requirements for [sending all media types are identical](https://support.whapi.cloud/help-desk/sending/send-video-audio-image-document)

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
sender_sticker = OpenapiClient::SenderSticker.new({to: '1234567891@s.whatsapp.net', media: nil}) # SenderSticker | Message sticker

begin
  # 🎭 Send media-sticker message
  result = api_instance.send_message_sticker(sender_sticker)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_sticker: #{e}"
end
```

#### Using the send_message_sticker_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> send_message_sticker_with_http_info(sender_sticker)

```ruby
begin
  # 🎭 Send media-sticker message
  data, status_code, headers = api_instance.send_message_sticker_with_http_info(sender_sticker)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_sticker_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sender_sticker** | [**SenderSticker**](SenderSticker.md) | Message sticker |  |

### Return type

[**SentMessage**](SentMessage.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## send_message_story

> <SentMessage> send_message_story(sender_stories)

👁️‍🗨️ Send story message

The method responsible for sending images or texts to your status. Remember that statuses disappear after 24 hours. The requirements for [sending all media types are identical](https://support.whapi.cloud/help-desk/sending/send-video-audio-image-document)

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
sender_stories = OpenapiClient::SenderStories.new # SenderStories | Stories post parameters

begin
  # 👁️‍🗨️ Send story message
  result = api_instance.send_message_story(sender_stories)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_story: #{e}"
end
```

#### Using the send_message_story_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> send_message_story_with_http_info(sender_stories)

```ruby
begin
  # 👁️‍🗨️ Send story message
  data, status_code, headers = api_instance.send_message_story_with_http_info(sender_stories)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_story_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sender_stories** | [**SenderStories**](SenderStories.md) | Stories post parameters |  |

### Return type

[**SentMessage**](SentMessage.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## send_message_story_audio

> <SentMessage> send_message_story_audio(sender_stories_audio)

🎵️ Send story audio message

The method responsible for sending audio to your status. Remember that statuses disappear after 24 hours. The requirements for [sending all media types are identical](https://support.whapi.cloud/help-desk/sending/send-video-audio-image-document)

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
sender_stories_audio = OpenapiClient::SenderStoriesAudio.new({media: nil}) # SenderStoriesAudio | Stories post parameters for audio

begin
  # 🎵️ Send story audio message
  result = api_instance.send_message_story_audio(sender_stories_audio)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_story_audio: #{e}"
end
```

#### Using the send_message_story_audio_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> send_message_story_audio_with_http_info(sender_stories_audio)

```ruby
begin
  # 🎵️ Send story audio message
  data, status_code, headers = api_instance.send_message_story_audio_with_http_info(sender_stories_audio)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_story_audio_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sender_stories_audio** | [**SenderStoriesAudio**](SenderStoriesAudio.md) | Stories post parameters for audio |  |

### Return type

[**SentMessage**](SentMessage.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## send_message_story_media

> <SentMessage> send_message_story_media(media, opts)

🖼 Send story media message

The method responsible for sending images or video to your status. Remember that statuses disappear after 24 hours. The requirements for [sending all media types are identical](https://support.whapi.cloud/help-desk/sending/send-video-audio-image-document)

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
media = nil # SendMediaMedia | 
opts = {
  mime_type: 'mime_type_example', # String | Mime type of media
  no_encode: true, # Boolean | Do not use our encoding
  no_cache: true, # Boolean | Do not use the cache in a request
  caption: 'caption_example', # String | Optional. Text caption under the media.
  preview: 'preview_example', # String | Optional. Base64 encoded preview of the media. In JPEG format.
  width: 56, # Integer | Width of the media in pixels
  height: 56, # Integer | Height of the media in pixels
  contacts: ['inner_example'], # Array<String> | List of contacts to send the story to
  exclude_contacts: ['inner_example'], # Array<String> | List of contacts to exclude
  experimental: true # Boolean | Some untested improvements
}

begin
  # 🖼 Send story media message
  result = api_instance.send_message_story_media(media, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_story_media: #{e}"
end
```

#### Using the send_message_story_media_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> send_message_story_media_with_http_info(media, opts)

```ruby
begin
  # 🖼 Send story media message
  data, status_code, headers = api_instance.send_message_story_media_with_http_info(media, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_story_media_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **media** | [**SendMediaMedia**](SendMediaMedia.md) |  |  |
| **mime_type** | **String** | Mime type of media | [optional] |
| **no_encode** | **Boolean** | Do not use our encoding | [optional] |
| **no_cache** | **Boolean** | Do not use the cache in a request | [optional] |
| **caption** | **String** | Optional. Text caption under the media. | [optional] |
| **preview** | **String** | Optional. Base64 encoded preview of the media. In JPEG format. | [optional] |
| **width** | **Integer** | Width of the media in pixels | [optional] |
| **height** | **Integer** | Height of the media in pixels | [optional] |
| **contacts** | [**Array&lt;String&gt;**](String.md) | List of contacts to send the story to | [optional] |
| **exclude_contacts** | [**Array&lt;String&gt;**](String.md) | List of contacts to exclude | [optional] |
| **experimental** | **Boolean** | Some untested improvements | [optional] |

### Return type

[**SentMessage**](SentMessage.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: multipart/form-data, application/json
- **Accept**: application/json


## send_message_story_text

> <SentMessage> send_message_story_text(sender_stories_text)

💬 Send story text message

The method responsible for sending texts to your status. Remember that statuses disappear after 24 hours.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
sender_stories_text = OpenapiClient::SenderStoriesText.new({caption: 'caption_example'}) # SenderStoriesText | Text stories post parameters

begin
  # 💬 Send story text message
  result = api_instance.send_message_story_text(sender_stories_text)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_story_text: #{e}"
end
```

#### Using the send_message_story_text_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> send_message_story_text_with_http_info(sender_stories_text)

```ruby
begin
  # 💬 Send story text message
  data, status_code, headers = api_instance.send_message_story_text_with_http_info(sender_stories_text)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_story_text_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sender_stories_text** | [**SenderStoriesText**](SenderStoriesText.md) | Text stories post parameters |  |

### Return type

[**SentMessage**](SentMessage.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## send_message_text

> <SentMessage> send_message_text(sender_text)

💬 Send text message

This endpoint will let you send messages to any WhatsApp-enabled phone number or to any WhatsApp Group/Channel using your own number connected to Whapi.Cloud. Follow the instructions if you want to [format text](https://support.whapi.cloud/help-desk/faq/whatsapp-text-formatting), [send a emoji](https://support.whapi.cloud/help-desk/sending/send-emoji) or [use line breaks](https://support.whapi.cloud/help-desk/faq/how-to-send-a-paragraph-line-break).

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
sender_text = OpenapiClient::SenderText.new({to: '1234567891@s.whatsapp.net', body: 'body_example'}) # SenderText | Message text

begin
  # 💬 Send text message
  result = api_instance.send_message_text(sender_text)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_text: #{e}"
end
```

#### Using the send_message_text_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> send_message_text_with_http_info(sender_text)

```ruby
begin
  # 💬 Send text message
  data, status_code, headers = api_instance.send_message_text_with_http_info(sender_text)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_text_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sender_text** | [**SenderText**](SenderText.md) | Message text |  |

### Return type

[**SentMessage**](SentMessage.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## send_message_video

> <SentMessage> send_message_video(sender_video)

🎥 Send media-video message

This method is responsible for sending a video message for chats. The requirements for [sending all media types are identical](https://support.whapi.cloud/help-desk/sending/send-video-audio-image-document)

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
sender_video = OpenapiClient::SenderVideo.new({to: '1234567891@s.whatsapp.net', media: nil}) # SenderVideo | Message video

begin
  # 🎥 Send media-video message
  result = api_instance.send_message_video(sender_video)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_video: #{e}"
end
```

#### Using the send_message_video_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> send_message_video_with_http_info(sender_video)

```ruby
begin
  # 🎥 Send media-video message
  data, status_code, headers = api_instance.send_message_video_with_http_info(sender_video)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_video_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sender_video** | [**SenderVideo**](SenderVideo.md) | Message video |  |

### Return type

[**SentMessage**](SentMessage.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## send_message_voice

> <SentMessage> send_message_voice(sender_voice)

🎤 Send media-voice message

This method is responsible for sending a voice message for chats. The requirements for [sending all media types are identical](https://support.whapi.cloud/help-desk/sending/send-video-audio-image-document). However, there are [some nuances](https://support.whapi.cloud/help-desk/sending/overview-of-other-methods-for-sending/send-voice-message) when sending voice messages

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
sender_voice = OpenapiClient::SenderVoice.new({to: '1234567891@s.whatsapp.net', media: nil}) # SenderVoice | Message voice

begin
  # 🎤 Send media-voice message
  result = api_instance.send_message_voice(sender_voice)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_voice: #{e}"
end
```

#### Using the send_message_voice_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> send_message_voice_with_http_info(sender_voice)

```ruby
begin
  # 🎤 Send media-voice message
  data, status_code, headers = api_instance.send_message_voice_with_http_info(sender_voice)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->send_message_voice_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sender_voice** | [**SenderVoice**](SenderVoice.md) | Message voice |  |

### Return type

[**SentMessage**](SentMessage.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## star_message

> <ResponseSuccess> star_message(message_id, star)

⭐ Star message

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
message_id = 'message_id_example' # String | Message ID
star = OpenapiClient::Star.new # Star | Star message

begin
  # ⭐ Star message
  result = api_instance.star_message(message_id, star)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->star_message: #{e}"
end
```

#### Using the star_message_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> star_message_with_http_info(message_id, star)

```ruby
begin
  # ⭐ Star message
  data, status_code, headers = api_instance.star_message_with_http_info(message_id, star)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->star_message_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **message_id** | **String** | Message ID |  |
| **star** | [**Star**](Star.md) | Star message |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## unpin_message

> <ResponseSuccess> unpin_message(message_id)

Unpin message

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::MessagesApi.new
message_id = 'message_id_example' # String | Message ID

begin
  # Unpin message
  result = api_instance.unpin_message(message_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->unpin_message: #{e}"
end
```

#### Using the unpin_message_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> unpin_message_with_http_info(message_id)

```ruby
begin
  # Unpin message
  data, status_code, headers = api_instance.unpin_message_with_http_info(message_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MessagesApi->unpin_message_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **message_id** | **String** | Message ID |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

