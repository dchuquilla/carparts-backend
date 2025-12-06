# OpenapiClient::ActionListSectionsInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **title** | **String** | Title of the section | [optional] |
| **rows** | [**Array&lt;ActionListSectionsInnerRowsInner&gt;**](ActionListSectionsInnerRowsInner.md) | Rows of the section | [optional] |
| **product_items** | [**Array&lt;ActionListSectionsInnerProductItemsInner&gt;**](ActionListSectionsInnerProductItemsInner.md) | Product items of the section | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::ActionListSectionsInner.new(
  title: null,
  rows: null,
  product_items: null
)
```

