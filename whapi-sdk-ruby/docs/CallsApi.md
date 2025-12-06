# OpenapiClient::CallsApi

All URIs are relative to *https://gate.whapi.cloud*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_call_event**](CallsApi.md#create_call_event) | **POST** /calls | Create call event |
| [**reject_call**](CallsApi.md#reject_call) | **POST** /calls/{CallID}/reject | Reject call |


## create_call_event

> <CreateCallEventResponse> create_call_event(create_call_event_request)

Create call event

This method is responsible for creating a call event.

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

api_instance = OpenapiClient::CallsApi.new
create_call_event_request = OpenapiClient::CreateCallEventRequest.new({start_time: 'start_time_example'}) # CreateCallEventRequest | Call data

begin
  # Create call event
  result = api_instance.create_call_event(create_call_event_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling CallsApi->create_call_event: #{e}"
end
```

#### Using the create_call_event_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateCallEventResponse>, Integer, Hash)> create_call_event_with_http_info(create_call_event_request)

```ruby
begin
  # Create call event
  data, status_code, headers = api_instance.create_call_event_with_http_info(create_call_event_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateCallEventResponse>
rescue OpenapiClient::ApiError => e
  puts "Error when calling CallsApi->create_call_event_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_call_event_request** | [**CreateCallEventRequest**](CreateCallEventRequest.md) | Call data |  |

### Return type

[**CreateCallEventResponse**](CreateCallEventResponse.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## reject_call

> <ResponseSuccess> reject_call(call_id, reject_call_request)

Reject call

This method is responsible for reject call.

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

api_instance = OpenapiClient::CallsApi.new
call_id = 'call_id_example' # String | Call ID
reject_call_request = OpenapiClient::RejectCallRequest.new({call_from: 'call_from_example'}) # RejectCallRequest | Reject call data

begin
  # Reject call
  result = api_instance.reject_call(call_id, reject_call_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling CallsApi->reject_call: #{e}"
end
```

#### Using the reject_call_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> reject_call_with_http_info(call_id, reject_call_request)

```ruby
begin
  # Reject call
  data, status_code, headers = api_instance.reject_call_with_http_info(call_id, reject_call_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling CallsApi->reject_call_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **call_id** | **String** | Call ID |  |
| **reject_call_request** | [**RejectCallRequest**](RejectCallRequest.md) | Reject call data |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

