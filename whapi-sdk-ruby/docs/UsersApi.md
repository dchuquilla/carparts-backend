# OpenapiClient::UsersApi

All URIs are relative to *https://gate.whapi.cloud*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_user_profile**](UsersApi.md#get_user_profile) | **GET** /users/profile | User info |
| [**login_user**](UsersApi.md#login_user) | **GET** /users/login | Login user with QR-base64 |
| [**login_user_image**](UsersApi.md#login_user_image) | **GET** /users/login/image | Login user with QR-image |
| [**login_user_row_data**](UsersApi.md#login_user_row_data) | **GET** /users/login/rowdata | Login user with QR-rowdata |
| [**login_user_via_auth_code**](UsersApi.md#login_user_via_auth_code) | **GET** /users/login/{PhoneNumber} | Get auth code by phone number |
| [**login_user_via_mobile**](UsersApi.md#login_user_via_mobile) | **POST** /users/login/mobile | Login in whatsapp with phone number |
| [**logout_user**](UsersApi.md#logout_user) | **POST** /users/logout | Logout user |
| [**update_user_profile**](UsersApi.md#update_user_profile) | **PATCH** /users/profile | Update user info |


## get_user_profile

> <UserProfile> get_user_profile

User info

The method allows you to get information about your WhatsApp profile

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

api_instance = OpenapiClient::UsersApi.new

begin
  # User info
  result = api_instance.get_user_profile
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->get_user_profile: #{e}"
end
```

#### Using the get_user_profile_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UserProfile>, Integer, Hash)> get_user_profile_with_http_info

```ruby
begin
  # User info
  data, status_code, headers = api_instance.get_user_profile_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UserProfile>
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->get_user_profile_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**UserProfile**](UserProfile.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## login_user

> <QR> login_user(opts)

Login user with QR-base64

This method returns an image of the type base64. You can render this in a component of the type image that is compatible with the language that you use to program. Just like on WhatsApp Web you will need to read a QR code to connect to Whapi.Cloud. There are two ways that you can do the reading of the QR code. Connect through our dashboard panel or Make this experience available within your own application.

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

api_instance = OpenapiClient::UsersApi.new
opts = {
  wakeup: true, # Boolean | If set to false, the channel will not launch
  size: 8.14, # Float | Size of QR-code
  width: 8.14, # Float | Width of result image
  height: 8.14, # Float | Height of result image
  color_light: 'color_light_example', # String | Background color
  color_dark: 'color_dark_example' # String | Color of code
}

begin
  # Login user with QR-base64
  result = api_instance.login_user(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->login_user: #{e}"
end
```

#### Using the login_user_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<QR>, Integer, Hash)> login_user_with_http_info(opts)

```ruby
begin
  # Login user with QR-base64
  data, status_code, headers = api_instance.login_user_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <QR>
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->login_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **wakeup** | **Boolean** | If set to false, the channel will not launch | [optional][default to true] |
| **size** | **Float** | Size of QR-code | [optional] |
| **width** | **Float** | Width of result image | [optional] |
| **height** | **Float** | Height of result image | [optional] |
| **color_light** | **String** | Background color | [optional] |
| **color_dark** | **String** | Color of code | [optional] |

### Return type

[**QR**](QR.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## login_user_image

> File login_user_image(opts)

Login user with QR-image

This method returns an image. Just like on WhatsApp Web you will need to read a QR code to connect to Whapi.Cloud. There are two ways that you can do the reading of the QR code. Connect through our dashboard panel or Make this experience available within your own application.

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

api_instance = OpenapiClient::UsersApi.new
opts = {
  wakeup: true, # Boolean | If set to false, the channel will not launch
  size: 8.14, # Float | Size of QR-code
  width: 8.14, # Float | Width of result image
  height: 8.14, # Float | Height of result image
  color_light: 'color_light_example', # String | Background color
  color_dark: 'color_dark_example' # String | Color of code
}

begin
  # Login user with QR-image
  result = api_instance.login_user_image(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->login_user_image: #{e}"
end
```

#### Using the login_user_image_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(File, Integer, Hash)> login_user_image_with_http_info(opts)

```ruby
begin
  # Login user with QR-image
  data, status_code, headers = api_instance.login_user_image_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => File
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->login_user_image_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **wakeup** | **Boolean** | If set to false, the channel will not launch | [optional][default to true] |
| **size** | **Float** | Size of QR-code | [optional] |
| **width** | **Float** | Width of result image | [optional] |
| **height** | **Float** | Height of result image | [optional] |
| **color_light** | **String** | Background color | [optional] |
| **color_dark** | **String** | Color of code | [optional] |

### Return type

**File**

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: image/png, application/json


## login_user_row_data

> <QR> login_user_row_data(opts)

Login user with QR-rowdata

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

api_instance = OpenapiClient::UsersApi.new
opts = {
  wakeup: true # Boolean | If set to false, the channel will not launch
}

begin
  # Login user with QR-rowdata
  result = api_instance.login_user_row_data(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->login_user_row_data: #{e}"
end
```

#### Using the login_user_row_data_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<QR>, Integer, Hash)> login_user_row_data_with_http_info(opts)

```ruby
begin
  # Login user with QR-rowdata
  data, status_code, headers = api_instance.login_user_row_data_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <QR>
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->login_user_row_data_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **wakeup** | **Boolean** | If set to false, the channel will not launch | [optional][default to true] |

### Return type

[**QR**](QR.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## login_user_via_auth_code

> <AuthCode> login_user_via_auth_code(phone_number)

Get auth code by phone number

This method returns a code that allows you to connect the phone number to the API without the need to scan a QR code, simply by entering the generated code.

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

api_instance = OpenapiClient::UsersApi.new
phone_number = 'phone_number_example' # String | Phone number without + and spaces, only digits

begin
  # Get auth code by phone number
  result = api_instance.login_user_via_auth_code(phone_number)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->login_user_via_auth_code: #{e}"
end
```

#### Using the login_user_via_auth_code_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AuthCode>, Integer, Hash)> login_user_via_auth_code_with_http_info(phone_number)

```ruby
begin
  # Get auth code by phone number
  data, status_code, headers = api_instance.login_user_via_auth_code_with_http_info(phone_number)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AuthCode>
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->login_user_via_auth_code_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **phone_number** | **String** | Phone number without + and spaces, only digits |  |

### Return type

[**AuthCode**](AuthCode.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## login_user_via_mobile

> <MobileLoginStatus> login_user_via_mobile(request_mobile_login)

Login in whatsapp with phone number

Allows you to register a number on WhatsApp. Requires mandatory use of mobile proxies!

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

api_instance = OpenapiClient::UsersApi.new
request_mobile_login = OpenapiClient::RequestMobileLogin.new({phone_number: 'phone_number_example'}) # RequestMobileLogin | Request body for login mobile

begin
  # Login in whatsapp with phone number
  result = api_instance.login_user_via_mobile(request_mobile_login)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->login_user_via_mobile: #{e}"
end
```

#### Using the login_user_via_mobile_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<MobileLoginStatus>, Integer, Hash)> login_user_via_mobile_with_http_info(request_mobile_login)

```ruby
begin
  # Login in whatsapp with phone number
  data, status_code, headers = api_instance.login_user_via_mobile_with_http_info(request_mobile_login)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <MobileLoginStatus>
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->login_user_via_mobile_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_mobile_login** | [**RequestMobileLogin**](RequestMobileLogin.md) | Request body for login mobile |  |

### Return type

[**MobileLoginStatus**](MobileLoginStatus.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## logout_user

> <ResponseSuccess> logout_user

Logout user

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

api_instance = OpenapiClient::UsersApi.new

begin
  # Logout user
  result = api_instance.logout_user
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->logout_user: #{e}"
end
```

#### Using the logout_user_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> logout_user_with_http_info

```ruby
begin
  # Logout user
  data, status_code, headers = api_instance.logout_user_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->logout_user_with_http_info: #{e}"
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


## update_user_profile

> <ResponseSuccess> update_user_profile(user_profile_update)

Update user info

This method is responsible for changing the details of your WhatsApp profile

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

api_instance = OpenapiClient::UsersApi.new
user_profile_update = OpenapiClient::UserProfileUpdate.new # UserProfileUpdate | Change user profile

begin
  # Update user info
  result = api_instance.update_user_profile(user_profile_update)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->update_user_profile: #{e}"
end
```

#### Using the update_user_profile_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> update_user_profile_with_http_info(user_profile_update)

```ruby
begin
  # Update user info
  data, status_code, headers = api_instance.update_user_profile_with_http_info(user_profile_update)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsersApi->update_user_profile_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **user_profile_update** | [**UserProfileUpdate**](UserProfileUpdate.md) | Change user profile |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json

