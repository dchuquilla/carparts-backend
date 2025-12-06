# OpenapiClient::BlacklistApi

All URIs are relative to *https://gate.whapi.cloud*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**blacklist_add**](BlacklistApi.md#blacklist_add) | **PUT** /blacklist/{ContactID} | Add contact to blacklist |
| [**blacklist_remove**](BlacklistApi.md#blacklist_remove) | **DELETE** /blacklist/{ContactID} | Remove contact from blacklist |


## blacklist_add

> <ResponseSuccess> blacklist_add(contact_id)

Add contact to blacklist

Through this method, it is possible to add the contact on the disallowed list (blacklist). This will restrict the specified numbers to certain interactions with your account

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::BlacklistApi.new
contact_id = 'contact_id_example' # String | Contact ID

begin
  # Add contact to blacklist
  result = api_instance.blacklist_add(contact_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling BlacklistApi->blacklist_add: #{e}"
end
```

#### Using the blacklist_add_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> blacklist_add_with_http_info(contact_id)

```ruby
begin
  # Add contact to blacklist
  data, status_code, headers = api_instance.blacklist_add_with_http_info(contact_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling BlacklistApi->blacklist_add_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **contact_id** | **String** | Contact ID |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## blacklist_remove

> <ResponseSuccess> blacklist_remove(contact_id)

Remove contact from blacklist

Through this method, it is possible to remove the contact on the disallowed list (blacklist)

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure API key authorization: tokenAuth
  config.api_key['token'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['token'] = 'Bearer'

  # Configure Bearer authorization (token): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::BlacklistApi.new
contact_id = 'contact_id_example' # String | Contact ID

begin
  # Remove contact from blacklist
  result = api_instance.blacklist_remove(contact_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling BlacklistApi->blacklist_remove: #{e}"
end
```

#### Using the blacklist_remove_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> blacklist_remove_with_http_info(contact_id)

```ruby
begin
  # Remove contact from blacklist
  data, status_code, headers = api_instance.blacklist_remove_with_http_info(contact_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling BlacklistApi->blacklist_remove_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **contact_id** | **String** | Contact ID |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

