# OpenapiClient::SenderStoriesText

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **contacts** | **Array&lt;String&gt;** | List of contacts to send the story to | [optional] |
| **exclude_contacts** | **Array&lt;String&gt;** | List of contacts to exclude | [optional] |
| **caption** | **String** | Optional. Text caption under the media. |  |
| **background_color** | **String** | Background color of the story (ARGB) | [optional][default to &#39;#00000000&#39;] |
| **caption_color** | **String** | Caption color of the story (ARGB) | [optional][default to &#39;#FFFFFFFF&#39;] |
| **font_type** | **String** | Font style of the story | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::SenderStoriesText.new(
  contacts: null,
  exclude_contacts: null,
  caption: null,
  background_color: #FF000000,
  caption_color: #FF000000,
  font_type: null
)
```

