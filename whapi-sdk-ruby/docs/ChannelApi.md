# OpenapiClient::ChannelApi

All URIs are relative to *https://gate.whapi.cloud*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**check_health**](ChannelApi.md#check_health) | **GET** /health | Check health &amp; launch channel |
| [**get_allowed_events**](ChannelApi.md#get_allowed_events) | **GET** /settings/events | Get allowed events |
| [**get_channel_settings**](ChannelApi.md#get_channel_settings) | **GET** /settings | Get channel settings |
| [**get_limits**](ChannelApi.md#get_limits) | **GET** /limits | Get limits |
| [**reset_channel_settings**](ChannelApi.md#reset_channel_settings) | **DELETE** /settings | Reset channel settings |
| [**update_channel_settings**](ChannelApi.md#update_channel_settings) | **PATCH** /settings | Update channel settings |
| [**webhook_test**](ChannelApi.md#webhook_test) | **POST** /settings/webhook_test | Test webhook |


## check_health

> <Health> check_health(opts)

Check health & launch channel

Allows you to track and get feedback on the operational status of the whapi channel (instance). An instance is a connection with a phone number that has a WhatsApp account, which will be responsible for sending and receiving messages

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

api_instance = OpenapiClient::ChannelApi.new
opts = {
  wakeup: true, # Boolean | If set to false, the channel will not launch
  platform: 'Chrome,Whapi,1.6.0', # String | Browser name, OS name, OS version separated by commas. Example: 'Safari,Windows,10.0.19044' or 'Desktop,Mac OS,11.6.3'
  channel_type: 'web' # String | Channel type. Web - for linking existing WA account via WA Web, Mobile - for creating new WA account
}

begin
  # Check health & launch channel
  result = api_instance.check_health(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling ChannelApi->check_health: #{e}"
end
```

#### Using the check_health_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Health>, Integer, Hash)> check_health_with_http_info(opts)

```ruby
begin
  # Check health & launch channel
  data, status_code, headers = api_instance.check_health_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Health>
rescue OpenapiClient::ApiError => e
  puts "Error when calling ChannelApi->check_health_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **wakeup** | **Boolean** | If set to false, the channel will not launch | [optional][default to true] |
| **platform** | **String** | Browser name, OS name, OS version separated by commas. Example: &#39;Safari,Windows,10.0.19044&#39; or &#39;Desktop,Mac OS,11.6.3&#39; | [optional] |
| **channel_type** | **String** | Channel type. Web - for linking existing WA account via WA Web, Mobile - for creating new WA account | [optional][default to &#39;web&#39;] |

### Return type

[**Health**](Health.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_allowed_events

> <Array<Event>> get_allowed_events

Get allowed events

Get a list of specific events that you can be notified about when Webhook is configured

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

api_instance = OpenapiClient::ChannelApi.new

begin
  # Get allowed events
  result = api_instance.get_allowed_events
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling ChannelApi->get_allowed_events: #{e}"
end
```

#### Using the get_allowed_events_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<Event>>, Integer, Hash)> get_allowed_events_with_http_info

```ruby
begin
  # Get allowed events
  data, status_code, headers = api_instance.get_allowed_events_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<Event>>
rescue OpenapiClient::ApiError => e
  puts "Error when calling ChannelApi->get_allowed_events_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**Array&lt;Event&gt;**](Event.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_channel_settings

> <Settings> get_channel_settings(opts)

Get channel settings

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

api_instance = OpenapiClient::ChannelApi.new
opts = {
  body: { ... } # Object | OK
}

begin
  # Get channel settings
  result = api_instance.get_channel_settings(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling ChannelApi->get_channel_settings: #{e}"
end
```

#### Using the get_channel_settings_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Settings>, Integer, Hash)> get_channel_settings_with_http_info(opts)

```ruby
begin
  # Get channel settings
  data, status_code, headers = api_instance.get_channel_settings_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Settings>
rescue OpenapiClient::ApiError => e
  puts "Error when calling ChannelApi->get_channel_settings_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **body** | **Object** | OK | [optional] |

### Return type

[**Settings**](Settings.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_limits

> <Limits> get_limits

Get limits

Sandbox as well as Trials have some limitations. This endpoint allows you to get information about the remaining and used limits on your channel

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

api_instance = OpenapiClient::ChannelApi.new

begin
  # Get limits
  result = api_instance.get_limits
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling ChannelApi->get_limits: #{e}"
end
```

#### Using the get_limits_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Limits>, Integer, Hash)> get_limits_with_http_info

```ruby
begin
  # Get limits
  data, status_code, headers = api_instance.get_limits_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Limits>
rescue OpenapiClient::ApiError => e
  puts "Error when calling ChannelApi->get_limits_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**Limits**](Limits.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## reset_channel_settings

> <ResponseSuccess> reset_channel_settings

Reset channel settings

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

api_instance = OpenapiClient::ChannelApi.new

begin
  # Reset channel settings
  result = api_instance.reset_channel_settings
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling ChannelApi->reset_channel_settings: #{e}"
end
```

#### Using the reset_channel_settings_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> reset_channel_settings_with_http_info

```ruby
begin
  # Reset channel settings
  data, status_code, headers = api_instance.reset_channel_settings_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling ChannelApi->reset_channel_settings_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_channel_settings

> <UpdateSettings> update_channel_settings(opts)

Update channel settings

If a field is not present in the request, no change is made to that setting. For example, if 'proxy' is not sent with the request, the existing configuration for 'proxy' is unchanged.

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

api_instance = OpenapiClient::ChannelApi.new
opts = {
  settings: OpenapiClient::Settings.new # Settings | New settings
}

begin
  # Update channel settings
  result = api_instance.update_channel_settings(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling ChannelApi->update_channel_settings: #{e}"
end
```

#### Using the update_channel_settings_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateSettings>, Integer, Hash)> update_channel_settings_with_http_info(opts)

```ruby
begin
  # Update channel settings
  data, status_code, headers = api_instance.update_channel_settings_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateSettings>
rescue OpenapiClient::ApiError => e
  puts "Error when calling ChannelApi->update_channel_settings_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **settings** | [**Settings**](Settings.md) | New settings | [optional] |

### Return type

[**UpdateSettings**](UpdateSettings.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## webhook_test

> <ResponseSuccess> webhook_test(opts)

Test webhook

For testing webhook.

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

api_instance = OpenapiClient::ChannelApi.new
opts = {
  webhook_test_request: OpenapiClient::WebhookTestRequest.new({type: 'messages', url: 'url_example', mode: 'body'}) # WebhookTestRequest | Options for webhook test
}

begin
  # Test webhook
  result = api_instance.webhook_test(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling ChannelApi->webhook_test: #{e}"
end
```

#### Using the webhook_test_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> webhook_test_with_http_info(opts)

```ruby
begin
  # Test webhook
  data, status_code, headers = api_instance.webhook_test_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling ChannelApi->webhook_test_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **webhook_test_request** | [**WebhookTestRequest**](WebhookTestRequest.md) | Options for webhook test | [optional] |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

