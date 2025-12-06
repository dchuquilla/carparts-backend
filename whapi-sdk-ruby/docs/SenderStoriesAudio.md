# OpenapiClient::SenderStoriesAudio

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **media** | [**SendMediaMedia**](SendMediaMedia.md) |  |  |
| **mime_type** | **String** | Mime type of media | [optional] |
| **no_encode** | **Boolean** | Do not use our encoding | [optional] |
| **no_cache** | **Boolean** | Do not use the cache in a request | [optional] |
| **seconds** | **Integer** | Optional. For audio files, this field indicates the duration of the audio file in seconds. | [optional] |
| **width** | **Integer** | Width of the media in pixels | [optional] |
| **height** | **Integer** | Height of the media in pixels | [optional] |
| **contacts** | **Array&lt;String&gt;** | List of contacts to send the story to | [optional] |
| **exclude_contacts** | **Array&lt;String&gt;** | List of contacts to exclude | [optional] |
| **background_color** | **String** | Background color of the story (ARGB) | [optional][default to &#39;#00000000&#39;] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::SenderStoriesAudio.new(
  media: null,
  mime_type: null,
  no_encode: null,
  no_cache: null,
  seconds: null,
  width: null,
  height: null,
  contacts: null,
  exclude_contacts: null,
  background_color: #FF000000
)
```

