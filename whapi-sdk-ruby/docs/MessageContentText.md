# OpenapiClient::MessageContentText

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **body** | **String** | Message text |  |
| **buttons** | [**Array&lt;Button&gt;**](Button.md) |  | [optional] |
| **sections** | [**Array&lt;ActionListSectionsInner&gt;**](ActionListSectionsInner.md) | Section of the message | [optional] |
| **button** | **String** | Button text for list of message | [optional] |
| **view_once** | **Boolean** | Is view once | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MessageContentText.new(
  body: null,
  buttons: null,
  sections: null,
  button: null,
  view_once: null
)
```

