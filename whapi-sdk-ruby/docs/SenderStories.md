# OpenapiClient::SenderStories

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **media** | [**SendMediaMedia**](SendMediaMedia.md) |  | [optional] |
| **mime_type** | **String** | Mime type of media | [optional] |
| **no_encode** | **Boolean** | Do not use our encoding | [optional] |
| **no_cache** | **Boolean** | Do not use the cache in a request | [optional] |
| **caption** | **String** | Optional. Text caption under the media. | [optional] |
| **preview** | **String** | Optional. Base64 encoded preview of the media. In JPEG format. | [optional] |
| **width** | **Integer** | Width of the media in pixels | [optional] |
| **height** | **Integer** | Height of the media in pixels | [optional] |
| **seconds** | **Integer** | Optional. For audio files, this field indicates the duration of the audio file in seconds. | [optional] |
| **contacts** | **Array&lt;String&gt;** | List of contacts to send the story to | [optional] |
| **exclude_contacts** | **Array&lt;String&gt;** | List of contacts to exclude | [optional] |
| **background_color** | **String** | Background color of the story (ARGB) | [optional][default to &#39;#00000000&#39;] |
| **caption_color** | **String** | Caption color of the story (ARGB) | [optional][default to &#39;#FFFFFFFF&#39;] |
| **font_type** | **String** | Font style of the story | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::SenderStories.new(
  media: null,
  mime_type: null,
  no_encode: null,
  no_cache: null,
  caption: null,
  preview: null,
  width: null,
  height: null,
  seconds: null,
  contacts: null,
  exclude_contacts: null,
  background_color: #FF000000,
  caption_color: #FF000000,
  font_type: null
)
```

