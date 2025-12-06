# OpenapiClient::NewslettersApi

All URIs are relative to *https://gate.whapi.cloud*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**accept_newsletter_admin_request**](NewslettersApi.md#accept_newsletter_admin_request) | **PUT** /newsletters/{NewsletterID}/admins/{ContactID} | Accept Newsletter admin-request |
| [**create_newsletter**](NewslettersApi.md#create_newsletter) | **POST** /newsletters | Create newsletter |
| [**create_newsletter_admin_invite**](NewslettersApi.md#create_newsletter_admin_invite) | **POST** /newsletters/{NewsletterID}/invite/{ContactID} | Create Newsletter admin-invite |
| [**delete_newsletter**](NewslettersApi.md#delete_newsletter) | **DELETE** /newsletters/{NewsletterID} | Delete newsletter |
| [**demote_newsletter_admin**](NewslettersApi.md#demote_newsletter_admin) | **DELETE** /newsletters/{NewsletterID}/admins/{ContactID} | Demote Newsletter admin |
| [**edit_newsletter**](NewslettersApi.md#edit_newsletter) | **PATCH** /newsletters/{NewsletterID} | Edit newsletter |
| [**find_newsletter**](NewslettersApi.md#find_newsletter) | **GET** /newsletters/find | Find newsletters by filters |
| [**get_messages_newsletter**](NewslettersApi.md#get_messages_newsletter) | **GET** /newsletters/{NewsletterID}/messages | Get newsletter messages |
| [**get_newsletter**](NewslettersApi.md#get_newsletter) | **GET** /newsletters/{NewsletterID} | Get newsletter information |
| [**get_newsletter_by_invite_code**](NewslettersApi.md#get_newsletter_by_invite_code) | **GET** /newsletters/link/{NewsletterInviteCode} | Get newsletter info by invite code |
| [**get_newsletters**](NewslettersApi.md#get_newsletters) | **GET** /newsletters | Get newsletters |
| [**recommended_newsletter**](NewslettersApi.md#recommended_newsletter) | **GET** /newsletters/recommended | Get recommended newsletters by country |
| [**revoke_newsletter_admin_invite**](NewslettersApi.md#revoke_newsletter_admin_invite) | **DELETE** /newsletters/{NewsletterID}/invite/{ContactID} | Revoke Newsletter admin-invite |
| [**send_newsletter_invite**](NewslettersApi.md#send_newsletter_invite) | **POST** /newsletters/link/{NewsletterInviteCode} | Send newsletter invite link |
| [**subscribe_newsletter**](NewslettersApi.md#subscribe_newsletter) | **POST** /newsletters/{NewsletterID}/subscription | Subscribe to newsletter |
| [**subscribe_newsletter_invite**](NewslettersApi.md#subscribe_newsletter_invite) | **POST** /newsletters/invite/{NewsletterInviteCode}/subscription | Subscribe to newsletter by invite code |
| [**tracking_newsletter**](NewslettersApi.md#tracking_newsletter) | **POST** /newsletters/{NewsletterID}/tracking | Subscribe to newsletter updates |
| [**unsubscribe_newsletter**](NewslettersApi.md#unsubscribe_newsletter) | **DELETE** /newsletters/{NewsletterID}/subscription | Unsubscribe from newsletter |
| [**unsubscribe_newsletter_invite**](NewslettersApi.md#unsubscribe_newsletter_invite) | **DELETE** /newsletters/invite/{NewsletterInviteCode}/subscription | Unsubscribe from newsletter by invite code |


## accept_newsletter_admin_request

> <ResponseSuccess> accept_newsletter_admin_request(newsletter_id, contact_id)

Accept Newsletter admin-request

This method is responsible for accepting an request to become an administrator of a WhatsApp Channel. This request is a message that you can both send like invitation and receive through the received message webhook

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

api_instance = OpenapiClient::NewslettersApi.new
newsletter_id = 'newsletter_id_example' # String | Newsletter ID
contact_id = 'contact_id_example' # String | Contact ID

begin
  # Accept Newsletter admin-request
  result = api_instance.accept_newsletter_admin_request(newsletter_id, contact_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->accept_newsletter_admin_request: #{e}"
end
```

#### Using the accept_newsletter_admin_request_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> accept_newsletter_admin_request_with_http_info(newsletter_id, contact_id)

```ruby
begin
  # Accept Newsletter admin-request
  data, status_code, headers = api_instance.accept_newsletter_admin_request_with_http_info(newsletter_id, contact_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->accept_newsletter_admin_request_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **newsletter_id** | **String** | Newsletter ID |  |
| **contact_id** | **String** | Contact ID |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## create_newsletter

> <Newsletter> create_newsletter(create_newsletter_request)

Create newsletter

This method is responsible for creating a WhatsApp Channel. [How to send a post to WhatsApp Channel](https://support.whapi.cloud/help-desk/channels/send-post-to-whatsapp-channel)

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

api_instance = OpenapiClient::NewslettersApi.new
create_newsletter_request = OpenapiClient::CreateNewsletterRequest.new({name: '<Newsletter Title>'}) # CreateNewsletterRequest | Newsletter data

begin
  # Create newsletter
  result = api_instance.create_newsletter(create_newsletter_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->create_newsletter: #{e}"
end
```

#### Using the create_newsletter_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Newsletter>, Integer, Hash)> create_newsletter_with_http_info(create_newsletter_request)

```ruby
begin
  # Create newsletter
  data, status_code, headers = api_instance.create_newsletter_with_http_info(create_newsletter_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Newsletter>
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->create_newsletter_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_newsletter_request** | [**CreateNewsletterRequest**](CreateNewsletterRequest.md) | Newsletter data |  |

### Return type

[**Newsletter**](Newsletter.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_newsletter_admin_invite

> <SentMessage> create_newsletter_admin_invite(newsletter_id, contact_id, opts)

Create Newsletter admin-invite

This method is responsible for sending an invitation for WhatsApp Channel administrator. Once the invitation is created, an invitation message will be sent to the contact

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

api_instance = OpenapiClient::NewslettersApi.new
newsletter_id = 'newsletter_id_example' # String | Newsletter ID
contact_id = 'contact_id_example' # String | Contact ID
opts = {
  create_newsletter_admin_invite_request: OpenapiClient::CreateNewsletterAdminInviteRequest.new # CreateNewsletterAdminInviteRequest | Invite data
}

begin
  # Create Newsletter admin-invite
  result = api_instance.create_newsletter_admin_invite(newsletter_id, contact_id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->create_newsletter_admin_invite: #{e}"
end
```

#### Using the create_newsletter_admin_invite_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> create_newsletter_admin_invite_with_http_info(newsletter_id, contact_id, opts)

```ruby
begin
  # Create Newsletter admin-invite
  data, status_code, headers = api_instance.create_newsletter_admin_invite_with_http_info(newsletter_id, contact_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->create_newsletter_admin_invite_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **newsletter_id** | **String** | Newsletter ID |  |
| **contact_id** | **String** | Contact ID |  |
| **create_newsletter_admin_invite_request** | [**CreateNewsletterAdminInviteRequest**](CreateNewsletterAdminInviteRequest.md) | Invite data | [optional] |

### Return type

[**SentMessage**](SentMessage.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_newsletter

> <ResponseSuccess> delete_newsletter(newsletter_id)

Delete newsletter

This method is responsible for deleting a WhatsApp Channel

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

api_instance = OpenapiClient::NewslettersApi.new
newsletter_id = 'newsletter_id_example' # String | Newsletter ID

begin
  # Delete newsletter
  result = api_instance.delete_newsletter(newsletter_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->delete_newsletter: #{e}"
end
```

#### Using the delete_newsletter_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> delete_newsletter_with_http_info(newsletter_id)

```ruby
begin
  # Delete newsletter
  data, status_code, headers = api_instance.delete_newsletter_with_http_info(newsletter_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->delete_newsletter_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **newsletter_id** | **String** | Newsletter ID |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## demote_newsletter_admin

> <ResponseSuccess> demote_newsletter_admin(newsletter_id, contact_id)

Demote Newsletter admin

This method is responsible for removing a user from the administration of the WhatsApp Channel

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

api_instance = OpenapiClient::NewslettersApi.new
newsletter_id = 'newsletter_id_example' # String | Newsletter ID
contact_id = 'contact_id_example' # String | Contact ID

begin
  # Demote Newsletter admin
  result = api_instance.demote_newsletter_admin(newsletter_id, contact_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->demote_newsletter_admin: #{e}"
end
```

#### Using the demote_newsletter_admin_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> demote_newsletter_admin_with_http_info(newsletter_id, contact_id)

```ruby
begin
  # Demote Newsletter admin
  data, status_code, headers = api_instance.demote_newsletter_admin_with_http_info(newsletter_id, contact_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->demote_newsletter_admin_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **newsletter_id** | **String** | Newsletter ID |  |
| **contact_id** | **String** | Contact ID |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## edit_newsletter

> <Newsletter> edit_newsletter(newsletter_id, edit_newsletter_request)

Edit newsletter

This method is responsible for editing a WhatsApp Newsletter Channel

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

api_instance = OpenapiClient::NewslettersApi.new
newsletter_id = 'newsletter_id_example' # String | Newsletter ID
edit_newsletter_request = OpenapiClient::EditNewsletterRequest.new # EditNewsletterRequest | Newsletter data

begin
  # Edit newsletter
  result = api_instance.edit_newsletter(newsletter_id, edit_newsletter_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->edit_newsletter: #{e}"
end
```

#### Using the edit_newsletter_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Newsletter>, Integer, Hash)> edit_newsletter_with_http_info(newsletter_id, edit_newsletter_request)

```ruby
begin
  # Edit newsletter
  data, status_code, headers = api_instance.edit_newsletter_with_http_info(newsletter_id, edit_newsletter_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Newsletter>
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->edit_newsletter_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **newsletter_id** | **String** | Newsletter ID |  |
| **edit_newsletter_request** | [**EditNewsletterRequest**](EditNewsletterRequest.md) | Newsletter data |  |

### Return type

[**Newsletter**](Newsletter.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## find_newsletter

> <NewslettersListPaged> find_newsletter(opts)

Find newsletters by filters

This method returns a list of WhatsApp Channels data based on the search performed using filters provided in the request body

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

api_instance = OpenapiClient::NewslettersApi.new
opts = {
  country_code: 'country_code_example', # String | Country for search
  search: 'search_example', # String | Search word
  newsletter_field: 'creation_time', # String | Cursor to continue pagination
  cursor: 'cursor_example', # String | Cursor to continue pagination
  count: 8.14, # Float | Count of objects to return
  sort: 'asc' # String | Order for items in request
}

begin
  # Find newsletters by filters
  result = api_instance.find_newsletter(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->find_newsletter: #{e}"
end
```

#### Using the find_newsletter_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<NewslettersListPaged>, Integer, Hash)> find_newsletter_with_http_info(opts)

```ruby
begin
  # Find newsletters by filters
  data, status_code, headers = api_instance.find_newsletter_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <NewslettersListPaged>
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->find_newsletter_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **country_code** | **String** | Country for search | [optional] |
| **search** | **String** | Search word | [optional] |
| **newsletter_field** | **String** | Cursor to continue pagination | [optional] |
| **cursor** | **String** | Cursor to continue pagination | [optional] |
| **count** | **Float** | Count of objects to return | [optional][default to 100] |
| **sort** | **String** | Order for items in request | [optional] |

### Return type

[**NewslettersListPaged**](NewslettersListPaged.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_messages_newsletter

> <MessagesList> get_messages_newsletter(newsletter_id, opts)

Get newsletter messages

The method returns the history of WhatsApp Channel messages

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

api_instance = OpenapiClient::NewslettersApi.new
newsletter_id = 'newsletter_id_example' # String | Newsletter ID
opts = {
  count: 8.14, # Float | Count of objects to return
  before: 8.14, # Float | Request messages before the specified one (see first and last)
  after: 8.14 # Float | Request messages after the specified one (see first and last)
}

begin
  # Get newsletter messages
  result = api_instance.get_messages_newsletter(newsletter_id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->get_messages_newsletter: #{e}"
end
```

#### Using the get_messages_newsletter_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<MessagesList>, Integer, Hash)> get_messages_newsletter_with_http_info(newsletter_id, opts)

```ruby
begin
  # Get newsletter messages
  data, status_code, headers = api_instance.get_messages_newsletter_with_http_info(newsletter_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <MessagesList>
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->get_messages_newsletter_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **newsletter_id** | **String** | Newsletter ID |  |
| **count** | **Float** | Count of objects to return | [optional][default to 100] |
| **before** | **Float** | Request messages before the specified one (see first and last) | [optional] |
| **after** | **Float** | Request messages after the specified one (see first and last) | [optional] |

### Return type

[**MessagesList**](MessagesList.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_newsletter

> <MessagesList> get_newsletter(newsletter_id, opts)

Get newsletter information

This method returns the metadata of a WhatsApp Channel

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

api_instance = OpenapiClient::NewslettersApi.new
newsletter_id = 'newsletter_id_example' # String | Newsletter ID
opts = {
  user_role: 'subscriber' # String | User's role regarding the newsletter
}

begin
  # Get newsletter information
  result = api_instance.get_newsletter(newsletter_id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->get_newsletter: #{e}"
end
```

#### Using the get_newsletter_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<MessagesList>, Integer, Hash)> get_newsletter_with_http_info(newsletter_id, opts)

```ruby
begin
  # Get newsletter information
  data, status_code, headers = api_instance.get_newsletter_with_http_info(newsletter_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <MessagesList>
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->get_newsletter_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **newsletter_id** | **String** | Newsletter ID |  |
| **user_role** | **String** | User&#39;s role regarding the newsletter | [optional] |

### Return type

[**MessagesList**](MessagesList.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_newsletter_by_invite_code

> <Newsletter> get_newsletter_by_invite_code(newsletter_invite_code)

Get newsletter info by invite code

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

api_instance = OpenapiClient::NewslettersApi.new
newsletter_invite_code = 'newsletter_invite_code_example' # String | Newsletter Invite Code

begin
  # Get newsletter info by invite code
  result = api_instance.get_newsletter_by_invite_code(newsletter_invite_code)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->get_newsletter_by_invite_code: #{e}"
end
```

#### Using the get_newsletter_by_invite_code_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Newsletter>, Integer, Hash)> get_newsletter_by_invite_code_with_http_info(newsletter_invite_code)

```ruby
begin
  # Get newsletter info by invite code
  data, status_code, headers = api_instance.get_newsletter_by_invite_code_with_http_info(newsletter_invite_code)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Newsletter>
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->get_newsletter_by_invite_code_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **newsletter_invite_code** | **String** | Newsletter Invite Code |  |

### Return type

[**Newsletter**](Newsletter.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_newsletters

> <NewslettersList> get_newsletters(opts)

Get newsletters

This method returns a list with metadata of your own WhatsApp Channel and followed Channels, including all Channel information and their views.

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

api_instance = OpenapiClient::NewslettersApi.new
opts = {
  count: 8.14, # Float | Count of objects to return
  offset: 8.14 # Float | Offset of objects to return
}

begin
  # Get newsletters
  result = api_instance.get_newsletters(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->get_newsletters: #{e}"
end
```

#### Using the get_newsletters_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<NewslettersList>, Integer, Hash)> get_newsletters_with_http_info(opts)

```ruby
begin
  # Get newsletters
  data, status_code, headers = api_instance.get_newsletters_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <NewslettersList>
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->get_newsletters_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **count** | **Float** | Count of objects to return | [optional][default to 100] |
| **offset** | **Float** | Offset of objects to return | [optional] |

### Return type

[**NewslettersList**](NewslettersList.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## recommended_newsletter

> <NewslettersListPaged> recommended_newsletter(opts)

Get recommended newsletters by country

This method returns a list of WhatsApp Channels data based on the search performed using filters provided in the request body

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

api_instance = OpenapiClient::NewslettersApi.new
opts = {
  country_code: 'country_code_example', # String | Country for search
  cursor: 'cursor_example', # String | Cursor to continue pagination
  count: 8.14 # Float | Count of objects to return
}

begin
  # Get recommended newsletters by country
  result = api_instance.recommended_newsletter(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->recommended_newsletter: #{e}"
end
```

#### Using the recommended_newsletter_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<NewslettersListPaged>, Integer, Hash)> recommended_newsletter_with_http_info(opts)

```ruby
begin
  # Get recommended newsletters by country
  data, status_code, headers = api_instance.recommended_newsletter_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <NewslettersListPaged>
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->recommended_newsletter_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **country_code** | **String** | Country for search | [optional] |
| **cursor** | **String** | Cursor to continue pagination | [optional] |
| **count** | **Float** | Count of objects to return | [optional][default to 100] |

### Return type

[**NewslettersListPaged**](NewslettersListPaged.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## revoke_newsletter_admin_invite

> <ResponseSuccess> revoke_newsletter_admin_invite(newsletter_id, contact_id)

Revoke Newsletter admin-invite

This method is responsible for revoking an invitation for WhatsApp Channel administrator.

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

api_instance = OpenapiClient::NewslettersApi.new
newsletter_id = 'newsletter_id_example' # String | Newsletter ID
contact_id = 'contact_id_example' # String | Contact ID

begin
  # Revoke Newsletter admin-invite
  result = api_instance.revoke_newsletter_admin_invite(newsletter_id, contact_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->revoke_newsletter_admin_invite: #{e}"
end
```

#### Using the revoke_newsletter_admin_invite_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> revoke_newsletter_admin_invite_with_http_info(newsletter_id, contact_id)

```ruby
begin
  # Revoke Newsletter admin-invite
  data, status_code, headers = api_instance.revoke_newsletter_admin_invite_with_http_info(newsletter_id, contact_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->revoke_newsletter_admin_invite_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **newsletter_id** | **String** | Newsletter ID |  |
| **contact_id** | **String** | Contact ID |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## send_newsletter_invite

> <SentMessage> send_newsletter_invite(newsletter_invite_code, sender_newsletter_invite_by_code)

Send newsletter invite link

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

api_instance = OpenapiClient::NewslettersApi.new
newsletter_invite_code = 'newsletter_invite_code_example' # String | Newsletter Invite Code
sender_newsletter_invite_by_code = OpenapiClient::SenderNewsletterInviteByCode.new({to: '1234567891@s.whatsapp.net'}) # SenderNewsletterInviteByCode | Newsletter invite link

begin
  # Send newsletter invite link
  result = api_instance.send_newsletter_invite(newsletter_invite_code, sender_newsletter_invite_by_code)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->send_newsletter_invite: #{e}"
end
```

#### Using the send_newsletter_invite_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> send_newsletter_invite_with_http_info(newsletter_invite_code, sender_newsletter_invite_by_code)

```ruby
begin
  # Send newsletter invite link
  data, status_code, headers = api_instance.send_newsletter_invite_with_http_info(newsletter_invite_code, sender_newsletter_invite_by_code)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->send_newsletter_invite_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **newsletter_invite_code** | **String** | Newsletter Invite Code |  |
| **sender_newsletter_invite_by_code** | [**SenderNewsletterInviteByCode**](SenderNewsletterInviteByCode.md) | Newsletter invite link |  |

### Return type

[**SentMessage**](SentMessage.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## subscribe_newsletter

> <ResponseSuccess> subscribe_newsletter(newsletter_id)

Subscribe to newsletter

This method is responsible for following a WhatsApp Channel

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

api_instance = OpenapiClient::NewslettersApi.new
newsletter_id = 'newsletter_id_example' # String | Newsletter ID

begin
  # Subscribe to newsletter
  result = api_instance.subscribe_newsletter(newsletter_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->subscribe_newsletter: #{e}"
end
```

#### Using the subscribe_newsletter_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> subscribe_newsletter_with_http_info(newsletter_id)

```ruby
begin
  # Subscribe to newsletter
  data, status_code, headers = api_instance.subscribe_newsletter_with_http_info(newsletter_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->subscribe_newsletter_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **newsletter_id** | **String** | Newsletter ID |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## subscribe_newsletter_invite

> <ResponseSuccess> subscribe_newsletter_invite(newsletter_invite_code)

Subscribe to newsletter by invite code

This method is responsible for following a WhatsApp Channel

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

api_instance = OpenapiClient::NewslettersApi.new
newsletter_invite_code = 'newsletter_invite_code_example' # String | Newsletter Invite Code

begin
  # Subscribe to newsletter by invite code
  result = api_instance.subscribe_newsletter_invite(newsletter_invite_code)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->subscribe_newsletter_invite: #{e}"
end
```

#### Using the subscribe_newsletter_invite_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> subscribe_newsletter_invite_with_http_info(newsletter_invite_code)

```ruby
begin
  # Subscribe to newsletter by invite code
  data, status_code, headers = api_instance.subscribe_newsletter_invite_with_http_info(newsletter_invite_code)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->subscribe_newsletter_invite_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **newsletter_invite_code** | **String** | Newsletter Invite Code |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## tracking_newsletter

> <ResponseSuccess> tracking_newsletter(newsletter_id)

Subscribe to newsletter updates

It is necessary to receive notifications about new votes in the polls

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

api_instance = OpenapiClient::NewslettersApi.new
newsletter_id = 'newsletter_id_example' # String | Newsletter ID

begin
  # Subscribe to newsletter updates
  result = api_instance.tracking_newsletter(newsletter_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->tracking_newsletter: #{e}"
end
```

#### Using the tracking_newsletter_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> tracking_newsletter_with_http_info(newsletter_id)

```ruby
begin
  # Subscribe to newsletter updates
  data, status_code, headers = api_instance.tracking_newsletter_with_http_info(newsletter_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->tracking_newsletter_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **newsletter_id** | **String** | Newsletter ID |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## unsubscribe_newsletter

> <ResponseSuccess> unsubscribe_newsletter(newsletter_id)

Unsubscribe from newsletter

This method is responsible for unfollowing a WhatsApp Channel

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

api_instance = OpenapiClient::NewslettersApi.new
newsletter_id = 'newsletter_id_example' # String | Newsletter ID

begin
  # Unsubscribe from newsletter
  result = api_instance.unsubscribe_newsletter(newsletter_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->unsubscribe_newsletter: #{e}"
end
```

#### Using the unsubscribe_newsletter_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> unsubscribe_newsletter_with_http_info(newsletter_id)

```ruby
begin
  # Unsubscribe from newsletter
  data, status_code, headers = api_instance.unsubscribe_newsletter_with_http_info(newsletter_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->unsubscribe_newsletter_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **newsletter_id** | **String** | Newsletter ID |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## unsubscribe_newsletter_invite

> <ResponseSuccess> unsubscribe_newsletter_invite(newsletter_invite_code)

Unsubscribe from newsletter by invite code

This method is responsible for unfollowing a WhatsApp Channel

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

api_instance = OpenapiClient::NewslettersApi.new
newsletter_invite_code = 'newsletter_invite_code_example' # String | Newsletter Invite Code

begin
  # Unsubscribe from newsletter by invite code
  result = api_instance.unsubscribe_newsletter_invite(newsletter_invite_code)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->unsubscribe_newsletter_invite: #{e}"
end
```

#### Using the unsubscribe_newsletter_invite_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> unsubscribe_newsletter_invite_with_http_info(newsletter_invite_code)

```ruby
begin
  # Unsubscribe from newsletter by invite code
  data, status_code, headers = api_instance.unsubscribe_newsletter_invite_with_http_info(newsletter_invite_code)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling NewslettersApi->unsubscribe_newsletter_invite_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **newsletter_invite_code** | **String** | Newsletter Invite Code |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

