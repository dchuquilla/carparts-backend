# OpenapiClient::MessageContentHSMHeader

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | Header type | [optional] |
| **text** | [**MessagePropsText**](MessagePropsText.md) |  | [optional] |
| **image** | [**MediaFile**](MediaFile.md) |  | [optional] |
| **video** | [**MediaFile**](MediaFile.md) |  | [optional] |
| **document** | [**MediaFile**](MediaFile.md) |  | [optional] |
| **location** | [**MessageContentLocation**](MessageContentLocation.md) |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessageContentHSMHeader.new(
  type: null,
  text: null,
  image: null,
  video: null,
  document: null,
  location: null
)
```

