# OpenapiClient::StoriesApi

All URIs are relative to *https://gate.whapi.cloud*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**copy_story**](StoriesApi.md#copy_story) | **PUT** /stories/{MessageID} | Copy story |
| [**create_story**](StoriesApi.md#create_story) | **POST** /stories | Create &amp; publish story |
| [**create_story_audio**](StoriesApi.md#create_story_audio) | **POST** /stories/send/audio | 🎵️ Post audio story |
| [**create_story_media**](StoriesApi.md#create_story_media) | **POST** /stories/send/media | 🖼 Post media story |
| [**create_story_text**](StoriesApi.md#create_story_text) | **POST** /stories/send/text | 💬 Post text story |
| [**delete_story**](StoriesApi.md#delete_story) | **DELETE** /stories/{MessageID} | Delete story |
| [**get_stories**](StoriesApi.md#get_stories) | **GET** /stories | Get list of stories |
| [**get_story**](StoriesApi.md#get_story) | **GET** /stories/{MessageID} | Get story |
| [**send_message_story_text**](StoriesApi.md#send_message_story_text) | **POST** /messages/story/text | 💬 Send story text message |


## copy_story

> <ResponseSuccess> copy_story(message_id, copy_stories)

Copy story

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

api_instance = OpenapiClient::StoriesApi.new
message_id = 'message_id_example' # String | Message ID
copy_stories = OpenapiClient::CopyStories.new # CopyStories | Stories post parameters

begin
  # Copy story
  result = api_instance.copy_story(message_id, copy_stories)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling StoriesApi->copy_story: #{e}"
end
```

#### Using the copy_story_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> copy_story_with_http_info(message_id, copy_stories)

```ruby
begin
  # Copy story
  data, status_code, headers = api_instance.copy_story_with_http_info(message_id, copy_stories)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling StoriesApi->copy_story_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **message_id** | **String** | Message ID |  |
| **copy_stories** | [**CopyStories**](CopyStories.md) | Stories post parameters |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_story

> <SentMessage> create_story(sender_stories)

Create & publish story

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

api_instance = OpenapiClient::StoriesApi.new
sender_stories = OpenapiClient::SenderStories.new # SenderStories | Stories post parameters

begin
  # Create & publish story
  result = api_instance.create_story(sender_stories)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling StoriesApi->create_story: #{e}"
end
```

#### Using the create_story_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> create_story_with_http_info(sender_stories)

```ruby
begin
  # Create & publish story
  data, status_code, headers = api_instance.create_story_with_http_info(sender_stories)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling StoriesApi->create_story_with_http_info: #{e}"
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

- **Content-Type**: application/json
- **Accept**: application/json


## create_story_audio

> <SentMessage> create_story_audio(sender_stories_audio)

🎵️ Post audio story

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

api_instance = OpenapiClient::StoriesApi.new
sender_stories_audio = OpenapiClient::SenderStoriesAudio.new({media: nil}) # SenderStoriesAudio | Stories post parameters for audio

begin
  # 🎵️ Post audio story
  result = api_instance.create_story_audio(sender_stories_audio)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling StoriesApi->create_story_audio: #{e}"
end
```

#### Using the create_story_audio_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> create_story_audio_with_http_info(sender_stories_audio)

```ruby
begin
  # 🎵️ Post audio story
  data, status_code, headers = api_instance.create_story_audio_with_http_info(sender_stories_audio)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling StoriesApi->create_story_audio_with_http_info: #{e}"
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


## create_story_media

> <SentMessage> create_story_media(media, opts)

🖼 Post media story

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

api_instance = OpenapiClient::StoriesApi.new
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
  # 🖼 Post media story
  result = api_instance.create_story_media(media, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling StoriesApi->create_story_media: #{e}"
end
```

#### Using the create_story_media_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> create_story_media_with_http_info(media, opts)

```ruby
begin
  # 🖼 Post media story
  data, status_code, headers = api_instance.create_story_media_with_http_info(media, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling StoriesApi->create_story_media_with_http_info: #{e}"
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


## create_story_text

> <SentMessage> create_story_text(sender_stories_text)

💬 Post text story

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

api_instance = OpenapiClient::StoriesApi.new
sender_stories_text = OpenapiClient::SenderStoriesText.new({caption: 'caption_example'}) # SenderStoriesText | Text stories post parameters

begin
  # 💬 Post text story
  result = api_instance.create_story_text(sender_stories_text)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling StoriesApi->create_story_text: #{e}"
end
```

#### Using the create_story_text_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> create_story_text_with_http_info(sender_stories_text)

```ruby
begin
  # 💬 Post text story
  data, status_code, headers = api_instance.create_story_text_with_http_info(sender_stories_text)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling StoriesApi->create_story_text_with_http_info: #{e}"
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


## delete_story

> <ResponseSuccess> delete_story(message_id)

Delete story

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

api_instance = OpenapiClient::StoriesApi.new
message_id = 'message_id_example' # String | Message ID

begin
  # Delete story
  result = api_instance.delete_story(message_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling StoriesApi->delete_story: #{e}"
end
```

#### Using the delete_story_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> delete_story_with_http_info(message_id)

```ruby
begin
  # Delete story
  data, status_code, headers = api_instance.delete_story_with_http_info(message_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling StoriesApi->delete_story_with_http_info: #{e}"
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


## get_stories

> <MessagesList> get_stories(opts)

Get list of stories

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

api_instance = OpenapiClient::StoriesApi.new
opts = {
  count: 8.14, # Float | Count of objects to return
  offset: 8.14, # Float | Offset of objects to return
  time_from: 8.14, # Float | Timestamp from which to get objects
  time_to: 8.14, # Float | Timestamp up to which to get objects
  normal_types: true, # Boolean | If false, include system messages
  author: 'author_example', # String | To filter by author (Contact ID)
  from_me: true # Boolean | If true, only return messages sent by the authenticated user. If false, only return messages sent by other users.
}

begin
  # Get list of stories
  result = api_instance.get_stories(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling StoriesApi->get_stories: #{e}"
end
```

#### Using the get_stories_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<MessagesList>, Integer, Hash)> get_stories_with_http_info(opts)

```ruby
begin
  # Get list of stories
  data, status_code, headers = api_instance.get_stories_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <MessagesList>
rescue OpenapiClient::ApiError => e
  puts "Error when calling StoriesApi->get_stories_with_http_info: #{e}"
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

### Return type

[**MessagesList**](MessagesList.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_story

> <Message> get_story(message_id)

Get story

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

api_instance = OpenapiClient::StoriesApi.new
message_id = 'message_id_example' # String | Message ID

begin
  # Get story
  result = api_instance.get_story(message_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling StoriesApi->get_story: #{e}"
end
```

#### Using the get_story_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Message>, Integer, Hash)> get_story_with_http_info(message_id)

```ruby
begin
  # Get story
  data, status_code, headers = api_instance.get_story_with_http_info(message_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Message>
rescue OpenapiClient::ApiError => e
  puts "Error when calling StoriesApi->get_story_with_http_info: #{e}"
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

api_instance = OpenapiClient::StoriesApi.new
sender_stories_text = OpenapiClient::SenderStoriesText.new({caption: 'caption_example'}) # SenderStoriesText | Text stories post parameters

begin
  # 💬 Send story text message
  result = api_instance.send_message_story_text(sender_stories_text)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling StoriesApi->send_message_story_text: #{e}"
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
  puts "Error when calling StoriesApi->send_message_story_text_with_http_info: #{e}"
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

