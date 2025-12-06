# OpenapiClient::MessageContextAD

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **advertiser_name** | **String** | Name of the advertiser | [optional] |
| **media_type** | [**MediaMessageType**](MediaMessageType.md) |  | [optional] |
| **preview** | **String** | Base64 encoded preview. In JPEG format. | [optional] |
| **preview_url** | **String** | URL of the preview | [optional] |
| **title** | **String** | Title of the advertisement | [optional] |
| **body** | **String** | Body of the advertisement | [optional] |
| **media_url** | **String** | URL of the media | [optional] |
| **source** | [**MessageContextADSource**](MessageContextADSource.md) |  | [optional] |
| **auto_reply** | **Boolean** | True if the advertisement contains an auto-reply | [optional] |
| **attrib** | **Boolean** | True if the advertisement shows the attributions | [optional] |
| **ctwa** | **String** | Call to action | [optional] |
| **ref** | **String** | Reference | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessageContextAD.new(
  advertiser_name: null,
  media_type: null,
  preview: null,
  preview_url: null,
  title: null,
  body: null,
  media_url: null,
  source: null,
  auto_reply: null,
  attrib: null,
  ctwa: null,
  ref: null
)
```

