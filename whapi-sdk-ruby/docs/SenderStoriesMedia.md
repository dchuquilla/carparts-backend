# OpenapiClient::SenderStoriesMedia

## Properties

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
| **contacts** | **Array&lt;String&gt;** | List of contacts to send the story to | [optional] |
| **exclude_contacts** | **Array&lt;String&gt;** | List of contacts to exclude | [optional] |
| **experimental** | **Boolean** | Some untested improvements | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::SenderStoriesMedia.new(
  media: null,
  mime_type: null,
  no_encode: null,
  no_cache: null,
  caption: null,
  preview: null,
  width: null,
  height: null,
  contacts: null,
  exclude_contacts: null,
  experimental: null
)
```

