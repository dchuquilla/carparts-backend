# OpenapiClient::PresencesApi

All URIs are relative to *https://gate.whapi.cloud*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_presence**](PresencesApi.md#get_presence) | **GET** /presences/{EntryID} | Get presence |
| [**send_me_presence**](PresencesApi.md#send_me_presence) | **PUT** /presences/me | Send online or offline presence |
| [**send_presence**](PresencesApi.md#send_presence) | **PUT** /presences/{EntryID} | Send typing or recording presence |
| [**subscribe_presence**](PresencesApi.md#subscribe_presence) | **POST** /presences/{EntryID} | Subscribe to presence |


## get_presence

> <Presence> get_presence(entry_id)

Get presence

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

api_instance = OpenapiClient::PresencesApi.new
entry_id = nil # GetPresenceEntryIDParameter | Contact or group id

begin
  # Get presence
  result = api_instance.get_presence(entry_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling PresencesApi->get_presence: #{e}"
end
```

#### Using the get_presence_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Presence>, Integer, Hash)> get_presence_with_http_info(entry_id)

```ruby
begin
  # Get presence
  data, status_code, headers = api_instance.get_presence_with_http_info(entry_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Presence>
rescue OpenapiClient::ApiError => e
  puts "Error when calling PresencesApi->get_presence_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **entry_id** | [**GetPresenceEntryIDParameter**](.md) | Contact or group id |  |

### Return type

[**Presence**](Presence.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## send_me_presence

> <CheckContactResponse> send_me_presence(opts)

Send online or offline presence

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

api_instance = OpenapiClient::PresencesApi.new
opts = {
  send_me_presence_request: OpenapiClient::SendMePresenceRequest.new({presence: 'online'}) # SendMePresenceRequest | 
}

begin
  # Send online or offline presence
  result = api_instance.send_me_presence(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling PresencesApi->send_me_presence: #{e}"
end
```

#### Using the send_me_presence_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CheckContactResponse>, Integer, Hash)> send_me_presence_with_http_info(opts)

```ruby
begin
  # Send online or offline presence
  data, status_code, headers = api_instance.send_me_presence_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CheckContactResponse>
rescue OpenapiClient::ApiError => e
  puts "Error when calling PresencesApi->send_me_presence_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **send_me_presence_request** | [**SendMePresenceRequest**](SendMePresenceRequest.md) |  | [optional] |

### Return type

[**CheckContactResponse**](CheckContactResponse.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## send_presence

> <CheckContactResponse> send_presence(entry_id, opts)

Send typing or recording presence

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

api_instance = OpenapiClient::PresencesApi.new
entry_id = nil # GetPresenceEntryIDParameter | Contact or group id
opts = {
  send_presence_request: OpenapiClient::SendPresenceRequest.new({presence: 'typing'}) # SendPresenceRequest | 
}

begin
  # Send typing or recording presence
  result = api_instance.send_presence(entry_id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling PresencesApi->send_presence: #{e}"
end
```

#### Using the send_presence_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CheckContactResponse>, Integer, Hash)> send_presence_with_http_info(entry_id, opts)

```ruby
begin
  # Send typing or recording presence
  data, status_code, headers = api_instance.send_presence_with_http_info(entry_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CheckContactResponse>
rescue OpenapiClient::ApiError => e
  puts "Error when calling PresencesApi->send_presence_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **entry_id** | [**GetPresenceEntryIDParameter**](.md) | Contact or group id |  |
| **send_presence_request** | [**SendPresenceRequest**](SendPresenceRequest.md) |  | [optional] |

### Return type

[**CheckContactResponse**](CheckContactResponse.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## subscribe_presence

> <CheckContactResponse> subscribe_presence(entry_id)

Subscribe to presence

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

api_instance = OpenapiClient::PresencesApi.new
entry_id = nil # GetPresenceEntryIDParameter | Contact or group id

begin
  # Subscribe to presence
  result = api_instance.subscribe_presence(entry_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling PresencesApi->subscribe_presence: #{e}"
end
```

#### Using the subscribe_presence_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CheckContactResponse>, Integer, Hash)> subscribe_presence_with_http_info(entry_id)

```ruby
begin
  # Subscribe to presence
  data, status_code, headers = api_instance.subscribe_presence_with_http_info(entry_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CheckContactResponse>
rescue OpenapiClient::ApiError => e
  puts "Error when calling PresencesApi->subscribe_presence_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **entry_id** | [**GetPresenceEntryIDParameter**](.md) | Contact or group id |  |

### Return type

[**CheckContactResponse**](CheckContactResponse.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

