# OpenapiClient::ContactsApi

All URIs are relative to *https://gate.whapi.cloud*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**check_exist**](ContactsApi.md#check_exist) | **HEAD** /contacts/{ContactID} | Check exist |
| [**check_phones**](ContactsApi.md#check_phones) | **POST** /contacts | Check phones |
| [**get_contact**](ContactsApi.md#get_contact) | **GET** /contacts/{ContactID} | Get contact |
| [**get_contact_profile**](ContactsApi.md#get_contact_profile) | **GET** /contacts/{ContactID}/profile | Get profile |
| [**get_contacts**](ContactsApi.md#get_contacts) | **GET** /contacts | Get contacts |
| [**send_contact**](ContactsApi.md#send_contact) | **POST** /contacts/{ContactID} | Send contact |


## check_exist

> <ResponseSuccess> check_exist(contact_id)

Check exist

The method individually checks for a number in WhatsApp without additional information

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

api_instance = OpenapiClient::ContactsApi.new
contact_id = 'contact_id_example' # String | Contact ID

begin
  # Check exist
  result = api_instance.check_exist(contact_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling ContactsApi->check_exist: #{e}"
end
```

#### Using the check_exist_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> check_exist_with_http_info(contact_id)

```ruby
begin
  # Check exist
  data, status_code, headers = api_instance.check_exist_with_http_info(contact_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling ContactsApi->check_exist_with_http_info: #{e}"
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


## check_phones

> <CheckContactResponse> check_phones(check_contact_request)

Check phones

This method returns whether or not the number has Whatsapp. Batch check provisioning is supported, and there is no batch check limit. However, an atypical mass check can draw attention to your number, so we advise [balancing the check between channels](https://support.whapi.cloud/help-desk/faq/checking-if-the-number-has-whatsapp)

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

api_instance = OpenapiClient::ContactsApi.new
check_contact_request = OpenapiClient::CheckContactRequest.new({contacts: ['contacts_example']}) # CheckContactRequest | Contact data

begin
  # Check phones
  result = api_instance.check_phones(check_contact_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling ContactsApi->check_phones: #{e}"
end
```

#### Using the check_phones_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CheckContactResponse>, Integer, Hash)> check_phones_with_http_info(check_contact_request)

```ruby
begin
  # Check phones
  data, status_code, headers = api_instance.check_phones_with_http_info(check_contact_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CheckContactResponse>
rescue OpenapiClient::ApiError => e
  puts "Error when calling ContactsApi->check_phones_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **check_contact_request** | [**CheckContactRequest**](CheckContactRequest.md) | Contact data |  |

### Return type

[**CheckContactResponse**](CheckContactResponse.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_contact

> <Contact> get_contact(contact_id)

Get contact

This method is responsible for returning all of you contact’s metadata

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

api_instance = OpenapiClient::ContactsApi.new
contact_id = 'contact_id_example' # String | Contact ID

begin
  # Get contact
  result = api_instance.get_contact(contact_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling ContactsApi->get_contact: #{e}"
end
```

#### Using the get_contact_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Contact>, Integer, Hash)> get_contact_with_http_info(contact_id)

```ruby
begin
  # Get contact
  data, status_code, headers = api_instance.get_contact_with_http_info(contact_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Contact>
rescue OpenapiClient::ApiError => e
  puts "Error when calling ContactsApi->get_contact_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **contact_id** | **String** | Contact ID |  |

### Return type

[**Contact**](Contact.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_contact_profile

> <UserProfile> get_contact_profile(contact_id)

Get profile

This method allows you to get profile information (description, profile image) by phone number, even if it is not in your contact list

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

api_instance = OpenapiClient::ContactsApi.new
contact_id = 'contact_id_example' # String | Contact ID

begin
  # Get profile
  result = api_instance.get_contact_profile(contact_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling ContactsApi->get_contact_profile: #{e}"
end
```

#### Using the get_contact_profile_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UserProfile>, Integer, Hash)> get_contact_profile_with_http_info(contact_id)

```ruby
begin
  # Get profile
  data, status_code, headers = api_instance.get_contact_profile_with_http_info(contact_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UserProfile>
rescue OpenapiClient::ApiError => e
  puts "Error when calling ContactsApi->get_contact_profile_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **contact_id** | **String** | Contact ID |  |

### Return type

[**UserProfile**](UserProfile.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_contacts

> <ContactsList> get_contacts(opts)

Get contacts

This method is responsible for returning all of your Whatsapp contacts

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

api_instance = OpenapiClient::ContactsApi.new
opts = {
  count: 8.14, # Float | Count of objects to return
  offset: 8.14 # Float | Offset of objects to return
}

begin
  # Get contacts
  result = api_instance.get_contacts(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling ContactsApi->get_contacts: #{e}"
end
```

#### Using the get_contacts_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ContactsList>, Integer, Hash)> get_contacts_with_http_info(opts)

```ruby
begin
  # Get contacts
  data, status_code, headers = api_instance.get_contacts_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ContactsList>
rescue OpenapiClient::ApiError => e
  puts "Error when calling ContactsApi->get_contacts_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **count** | **Float** | Count of objects to return | [optional][default to 100] |
| **offset** | **Float** | Offset of objects to return | [optional] |

### Return type

[**ContactsList**](ContactsList.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## send_contact

> <SentMessage> send_contact(contact_id, sender_contact_from_phonebook)

Send contact

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

api_instance = OpenapiClient::ContactsApi.new
contact_id = 'contact_id_example' # String | Contact ID
sender_contact_from_phonebook = OpenapiClient::SenderContactFromPhonebook.new({to: '1234567891@s.whatsapp.net'}) # SenderContactFromPhonebook | Message contact

begin
  # Send contact
  result = api_instance.send_contact(contact_id, sender_contact_from_phonebook)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling ContactsApi->send_contact: #{e}"
end
```

#### Using the send_contact_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> send_contact_with_http_info(contact_id, sender_contact_from_phonebook)

```ruby
begin
  # Send contact
  data, status_code, headers = api_instance.send_contact_with_http_info(contact_id, sender_contact_from_phonebook)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling ContactsApi->send_contact_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **contact_id** | **String** | Contact ID |  |
| **sender_contact_from_phonebook** | [**SenderContactFromPhonebook**](SenderContactFromPhonebook.md) | Message contact |  |

### Return type

[**SentMessage**](SentMessage.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json

