# OpenapiClient::StatusesApi

All URIs are relative to *https://gate.whapi.cloud*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_message_view_statuses**](StatusesApi.md#get_message_view_statuses) | **GET** /statuses/{MessageID} | Get message or story view statuses |


## get_message_view_statuses

> <StatusesList> get_message_view_statuses(message_id)

Get message or story view statuses

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

api_instance = OpenapiClient::StatusesApi.new
message_id = 'message_id_example' # String | Message ID

begin
  # Get message or story view statuses
  result = api_instance.get_message_view_statuses(message_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling StatusesApi->get_message_view_statuses: #{e}"
end
```

#### Using the get_message_view_statuses_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<StatusesList>, Integer, Hash)> get_message_view_statuses_with_http_info(message_id)

```ruby
begin
  # Get message or story view statuses
  data, status_code, headers = api_instance.get_message_view_statuses_with_http_info(message_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <StatusesList>
rescue OpenapiClient::ApiError => e
  puts "Error when calling StatusesApi->get_message_view_statuses_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **message_id** | **String** | Message ID |  |

### Return type

[**StatusesList**](StatusesList.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

