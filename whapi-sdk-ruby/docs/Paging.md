# OpenapiClient::Paging

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **end_cursor** | **String** | Cursor for next page | [optional] |
| **start_cursor** | **String** | Cursor of the current page | [optional] |
| **next_page** | **Boolean** | Does next page exit | [optional] |
| **previous_page** | **Boolean** | Does previous page exit | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Paging.new(
  end_cursor: null,
  start_cursor: null,
  next_page: null,
  previous_page: null
)
```

