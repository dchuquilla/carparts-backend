# OpenapiClient::Contact

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | WA ID |  |
| **name** | **String** | Contact title from contact book |  |
| **pushname** | **String** | Account name from WA or WA Business name | [optional] |
| **is_business** | **Boolean** | Is a business account | [optional] |
| **profile_pic** | **String** | Profile picture URL | [optional] |
| **profile_pic_full** | **String** | Profile full picture URL | [optional] |
| **status** | **String** | Contact status | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Contact.new(
  id: null,
  name: null,
  pushname: null,
  is_business: null,
  profile_pic: null,
  profile_pic_full: null,
  status: null
)
```

