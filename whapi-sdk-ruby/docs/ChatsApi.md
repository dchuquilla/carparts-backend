# OpenapiClient::ChatsApi

All URIs are relative to *https://gate.whapi.cloud*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**archive_chat**](ChatsApi.md#archive_chat) | **POST** /chats/{ChatID} | 🗄 Archive/Unarchive chat |
| [**delete_chat**](ChatsApi.md#delete_chat) | **DELETE** /chats/{ChatID} | ❌ Delete chat |
| [**get_chat**](ChatsApi.md#get_chat) | **GET** /chats/{ChatID} | Get chat |
| [**get_chats**](ChatsApi.md#get_chats) | **GET** /chats | Get chats |
| [**patch_chat**](ChatsApi.md#patch_chat) | **PATCH** /chats/{ChatID} | ⚙️Chat Settings Management: Pin, Mute, Read, Disappearing. |


## archive_chat

> <ResponseSuccess> archive_chat(chat_id, opts)

🗄 Archive/Unarchive chat

This method is responsible for archiving or unarchiving chats

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

api_instance = OpenapiClient::ChatsApi.new
chat_id = 'chat_id_example' # String | Chat ID
opts = {
  archive_chat_request: OpenapiClient::ArchiveChatRequest.new # ArchiveChatRequest | Request body
}

begin
  # 🗄 Archive/Unarchive chat
  result = api_instance.archive_chat(chat_id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling ChatsApi->archive_chat: #{e}"
end
```

#### Using the archive_chat_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> archive_chat_with_http_info(chat_id, opts)

```ruby
begin
  # 🗄 Archive/Unarchive chat
  data, status_code, headers = api_instance.archive_chat_with_http_info(chat_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling ChatsApi->archive_chat_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **chat_id** | **String** | Chat ID |  |
| **archive_chat_request** | [**ArchiveChatRequest**](ArchiveChatRequest.md) | Request body | [optional] |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_chat

> <ResponseSuccess> delete_chat(chat_id)

❌ Delete chat

This method is responsible for deleting chats

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

api_instance = OpenapiClient::ChatsApi.new
chat_id = 'chat_id_example' # String | Chat ID

begin
  # ❌ Delete chat
  result = api_instance.delete_chat(chat_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling ChatsApi->delete_chat: #{e}"
end
```

#### Using the delete_chat_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> delete_chat_with_http_info(chat_id)

```ruby
begin
  # ❌ Delete chat
  data, status_code, headers = api_instance.delete_chat_with_http_info(chat_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling ChatsApi->delete_chat_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **chat_id** | **String** | Chat ID |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_chat

> <Chat> get_chat(chat_id)

Get chat

This method is responsible for returning the metadata of a chat. Read more about [Chat ID](https://support.whapi.cloud/help-desk/faq/chat-id.-what-is-it-and-how-to-get-it)

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

api_instance = OpenapiClient::ChatsApi.new
chat_id = 'chat_id_example' # String | Chat ID

begin
  # Get chat
  result = api_instance.get_chat(chat_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling ChatsApi->get_chat: #{e}"
end
```

#### Using the get_chat_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Chat>, Integer, Hash)> get_chat_with_http_info(chat_id)

```ruby
begin
  # Get chat
  data, status_code, headers = api_instance.get_chat_with_http_info(chat_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Chat>
rescue OpenapiClient::ApiError => e
  puts "Error when calling ChatsApi->get_chat_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **chat_id** | **String** | Chat ID |  |

### Return type

[**Chat**](Chat.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_chats

> <ChatsList> get_chats(opts)

Get chats

This method is responsible for returning all of your chats. If you need to get a profile pic of your contacts or chats, [refer to these instructions](https://support.whapi.cloud/help-desk/receiving/http-api/get-a-profile-picture-of-a-chat-or-user).

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

api_instance = OpenapiClient::ChatsApi.new
opts = {
  count: 8.14, # Float | Count of objects to return
  offset: 8.14 # Float | Offset of objects to return
}

begin
  # Get chats
  result = api_instance.get_chats(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling ChatsApi->get_chats: #{e}"
end
```

#### Using the get_chats_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ChatsList>, Integer, Hash)> get_chats_with_http_info(opts)

```ruby
begin
  # Get chats
  data, status_code, headers = api_instance.get_chats_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ChatsList>
rescue OpenapiClient::ApiError => e
  puts "Error when calling ChatsApi->get_chats_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **count** | **Float** | Count of objects to return | [optional][default to 100] |
| **offset** | **Float** | Offset of objects to return | [optional] |

### Return type

[**ChatsList**](ChatsList.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## patch_chat

> <ResponseSuccess> patch_chat(chat_id, opts)

⚙️Chat Settings Management: Pin, Mute, Read, Disappearing.

This method is responsible for pinning and unpinning, for muting and unmuting your chats. Also this method is responsible for performing the action of reading an entire chat or marking a chat as unread

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

api_instance = OpenapiClient::ChatsApi.new
chat_id = 'chat_id_example' # String | Chat ID
opts = {
  patch_chat_request: OpenapiClient::PatchChatRequest.new # PatchChatRequest | Request body
}

begin
  # ⚙️Chat Settings Management: Pin, Mute, Read, Disappearing.
  result = api_instance.patch_chat(chat_id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling ChatsApi->patch_chat: #{e}"
end
```

#### Using the patch_chat_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> patch_chat_with_http_info(chat_id, opts)

```ruby
begin
  # ⚙️Chat Settings Management: Pin, Mute, Read, Disappearing.
  data, status_code, headers = api_instance.patch_chat_with_http_info(chat_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling ChatsApi->patch_chat_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **chat_id** | **String** | Chat ID |  |
| **patch_chat_request** | [**PatchChatRequest**](PatchChatRequest.md) | Request body | [optional] |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

