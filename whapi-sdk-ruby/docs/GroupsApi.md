# OpenapiClient::GroupsApi

All URIs are relative to *https://gate.whapi.cloud*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**accept_group_invite**](GroupsApi.md#accept_group_invite) | **PUT** /groups | Accept group invite |
| [**add_group_participant**](GroupsApi.md#add_group_participant) | **POST** /groups/{GroupID}/participants | Add group participant |
| [**approve_group_applications_list**](GroupsApi.md#approve_group_applications_list) | **POST** /groups/{GroupID}/applications | Accept group applications for listed users |
| [**create_group**](GroupsApi.md#create_group) | **POST** /groups | Create group |
| [**delete_group_icon**](GroupsApi.md#delete_group_icon) | **DELETE** /groups/{GroupID}/icon | Delete group icon |
| [**demote_group_admin**](GroupsApi.md#demote_group_admin) | **DELETE** /groups/{GroupID}/admins | Demote group admin |
| [**get_group**](GroupsApi.md#get_group) | **GET** /groups/{GroupID} | Get group |
| [**get_group_applications_list**](GroupsApi.md#get_group_applications_list) | **GET** /groups/{GroupID}/applications | Get list of join requests to the group |
| [**get_group_icon**](GroupsApi.md#get_group_icon) | **GET** /groups/{GroupID}/icon | Get group icon |
| [**get_group_invite**](GroupsApi.md#get_group_invite) | **GET** /groups/{GroupID}/invite | Get group invite |
| [**get_group_metadata_by_invite_code**](GroupsApi.md#get_group_metadata_by_invite_code) | **GET** /groups/link/{InviteCode} | Get group info by invite code |
| [**get_groups**](GroupsApi.md#get_groups) | **GET** /groups | Get groups |
| [**leave_group**](GroupsApi.md#leave_group) | **DELETE** /groups/{GroupID} | Leave group |
| [**promote_to_group_admin**](GroupsApi.md#promote_to_group_admin) | **PATCH** /groups/{GroupID}/admins | Promote to group admin |
| [**reject_group_applications_list**](GroupsApi.md#reject_group_applications_list) | **DELETE** /groups/{GroupID}/applications | Reject group applications for listed users |
| [**remove_group_participant**](GroupsApi.md#remove_group_participant) | **DELETE** /groups/{GroupID}/participants | Remove group participant |
| [**revoke_group_invite**](GroupsApi.md#revoke_group_invite) | **DELETE** /groups/{GroupID}/invite | Revoke group invite |
| [**send_group_invite**](GroupsApi.md#send_group_invite) | **POST** /groups/link/{InviteCode} | Send group invite link |
| [**set_group_icon**](GroupsApi.md#set_group_icon) | **PUT** /groups/{GroupID}/icon | Set group icon |
| [**update_group_info**](GroupsApi.md#update_group_info) | **PUT** /groups/{GroupID} | Update group info |
| [**update_group_setting**](GroupsApi.md#update_group_setting) | **PATCH** /groups/{GroupID} | Update group setting |


## accept_group_invite

> <NewGroup> accept_group_invite(group_invite)

Accept group invite

Allows you to join a group by knowing its invitation code

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

api_instance = OpenapiClient::GroupsApi.new
group_invite = OpenapiClient::GroupInvite.new({invite_code: 'invite_code_example'}) # GroupInvite | Group data

begin
  # Accept group invite
  result = api_instance.accept_group_invite(group_invite)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->accept_group_invite: #{e}"
end
```

#### Using the accept_group_invite_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<NewGroup>, Integer, Hash)> accept_group_invite_with_http_info(group_invite)

```ruby
begin
  # Accept group invite
  data, status_code, headers = api_instance.accept_group_invite_with_http_info(group_invite)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <NewGroup>
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->accept_group_invite_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **group_invite** | [**GroupInvite**](GroupInvite.md) | Group data |  |

### Return type

[**NewGroup**](NewGroup.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## add_group_participant

> <ResponseListParticipants> add_group_participant(group_id, list_participants_request)

Add group participant

This method is responsible for adding new members to the group. Due to WhatsApp's anti-spam policy, some contacts are not automatically added to the group. [Read more here](https://support.whapi.cloud/help-desk/groups/add-new-member-to-group)

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

api_instance = OpenapiClient::GroupsApi.new
group_id = 'group_id_example' # String | Group ID
list_participants_request = OpenapiClient::ListParticipantsRequest.new({participants: ['participants_example']}) # ListParticipantsRequest | 

begin
  # Add group participant
  result = api_instance.add_group_participant(group_id, list_participants_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->add_group_participant: #{e}"
end
```

#### Using the add_group_participant_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseListParticipants>, Integer, Hash)> add_group_participant_with_http_info(group_id, list_participants_request)

```ruby
begin
  # Add group participant
  data, status_code, headers = api_instance.add_group_participant_with_http_info(group_id, list_participants_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseListParticipants>
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->add_group_participant_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **group_id** | **String** | Group ID |  |
| **list_participants_request** | [**ListParticipantsRequest**](ListParticipantsRequest.md) |  |  |

### Return type

[**ResponseListParticipants**](ResponseListParticipants.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## approve_group_applications_list

> <Array<GroupApplicationChange>> approve_group_applications_list(group_id, opts)

Accept group applications for listed users

This method returns the list with result of operation for each user

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

api_instance = OpenapiClient::GroupsApi.new
group_id = 'group_id_example' # String | Group ID
opts = {
  application_request: OpenapiClient::ApplicationRequest.new # ApplicationRequest | Chat ID list
}

begin
  # Accept group applications for listed users
  result = api_instance.approve_group_applications_list(group_id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->approve_group_applications_list: #{e}"
end
```

#### Using the approve_group_applications_list_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<GroupApplicationChange>>, Integer, Hash)> approve_group_applications_list_with_http_info(group_id, opts)

```ruby
begin
  # Accept group applications for listed users
  data, status_code, headers = api_instance.approve_group_applications_list_with_http_info(group_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<GroupApplicationChange>>
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->approve_group_applications_list_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **group_id** | **String** | Group ID |  |
| **application_request** | [**ApplicationRequest**](ApplicationRequest.md) | Chat ID list | [optional] |

### Return type

[**Array&lt;GroupApplicationChange&gt;**](GroupApplicationChange.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_group

> <GroupCreate> create_group(create_group_request)

Create group

This method is responsible for creating a group with its respective participants. Just like WhatsApp you will need to add at least one contact to be able to create a group. Due to WhatsApp's anti-spam policy, some contacts are not automatically added to the group. [Read more here](https://support.whapi.cloud/help-desk/groups/add-new-member-to-group)

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

api_instance = OpenapiClient::GroupsApi.new
create_group_request = OpenapiClient::CreateGroupRequest.new({participants: ['participants_example'], subject: 'subject_example'}) # CreateGroupRequest | Group data

begin
  # Create group
  result = api_instance.create_group(create_group_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->create_group: #{e}"
end
```

#### Using the create_group_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GroupCreate>, Integer, Hash)> create_group_with_http_info(create_group_request)

```ruby
begin
  # Create group
  data, status_code, headers = api_instance.create_group_with_http_info(create_group_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GroupCreate>
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->create_group_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_group_request** | [**CreateGroupRequest**](CreateGroupRequest.md) | Group data |  |

### Return type

[**GroupCreate**](GroupCreate.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_group_icon

> <ResponseSuccess> delete_group_icon(group_id)

Delete group icon

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

api_instance = OpenapiClient::GroupsApi.new
group_id = 'group_id_example' # String | Group ID

begin
  # Delete group icon
  result = api_instance.delete_group_icon(group_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->delete_group_icon: #{e}"
end
```

#### Using the delete_group_icon_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> delete_group_icon_with_http_info(group_id)

```ruby
begin
  # Delete group icon
  data, status_code, headers = api_instance.delete_group_icon_with_http_info(group_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->delete_group_icon_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **group_id** | **String** | Group ID |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## demote_group_admin

> <ResponseSuccess> demote_group_admin(group_id, list_participants_request)

Demote group admin

This method is responsible for removing one or more admins from a group

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

api_instance = OpenapiClient::GroupsApi.new
group_id = 'group_id_example' # String | Group ID
list_participants_request = OpenapiClient::ListParticipantsRequest.new({participants: ['participants_example']}) # ListParticipantsRequest | 

begin
  # Demote group admin
  result = api_instance.demote_group_admin(group_id, list_participants_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->demote_group_admin: #{e}"
end
```

#### Using the demote_group_admin_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> demote_group_admin_with_http_info(group_id, list_participants_request)

```ruby
begin
  # Demote group admin
  data, status_code, headers = api_instance.demote_group_admin_with_http_info(group_id, list_participants_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->demote_group_admin_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **group_id** | **String** | Group ID |  |
| **list_participants_request** | [**ListParticipantsRequest**](ListParticipantsRequest.md) |  |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_group

> <Group> get_group(group_id)

Get group

This method returns the group metadata with all information about the group and its participants

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

api_instance = OpenapiClient::GroupsApi.new
group_id = 'group_id_example' # String | Group ID

begin
  # Get group
  result = api_instance.get_group(group_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->get_group: #{e}"
end
```

#### Using the get_group_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Group>, Integer, Hash)> get_group_with_http_info(group_id)

```ruby
begin
  # Get group
  data, status_code, headers = api_instance.get_group_with_http_info(group_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Group>
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->get_group_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **group_id** | **String** | Group ID |  |

### Return type

[**Group**](Group.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_group_applications_list

> <GroupApplicationList> get_group_applications_list(group_id, opts)

Get list of join requests to the group

This method returns the list of join requests to the group

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

api_instance = OpenapiClient::GroupsApi.new
group_id = 'group_id_example' # String | Group ID
opts = {
  count: 8.14, # Float | Count of objects to return
  offset: 8.14 # Float | Offset of objects to return
}

begin
  # Get list of join requests to the group
  result = api_instance.get_group_applications_list(group_id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->get_group_applications_list: #{e}"
end
```

#### Using the get_group_applications_list_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GroupApplicationList>, Integer, Hash)> get_group_applications_list_with_http_info(group_id, opts)

```ruby
begin
  # Get list of join requests to the group
  data, status_code, headers = api_instance.get_group_applications_list_with_http_info(group_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GroupApplicationList>
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->get_group_applications_list_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **group_id** | **String** | Group ID |  |
| **count** | **Float** | Count of objects to return | [optional][default to 100] |
| **offset** | **Float** | Offset of objects to return | [optional] |

### Return type

[**GroupApplicationList**](GroupApplicationList.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_group_icon

> File get_group_icon(group_id)

Get group icon

This method returns the profile image of group

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

api_instance = OpenapiClient::GroupsApi.new
group_id = 'group_id_example' # String | Group ID

begin
  # Get group icon
  result = api_instance.get_group_icon(group_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->get_group_icon: #{e}"
end
```

#### Using the get_group_icon_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(File, Integer, Hash)> get_group_icon_with_http_info(group_id)

```ruby
begin
  # Get group icon
  data, status_code, headers = api_instance.get_group_icon_with_http_info(group_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => File
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->get_group_icon_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **group_id** | **String** | Group ID |  |

### Return type

**File**

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: image/png, application/json


## get_group_invite

> <GroupInvite> get_group_invite(group_id)

Get group invite

This method retrieves the ID of the group invitation. [What it is and how to work with it](https://support.whapi.cloud/help-desk/groups/add-new-member-to-group#sending-an-invitation-to-a-group)

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

api_instance = OpenapiClient::GroupsApi.new
group_id = 'group_id_example' # String | Group ID

begin
  # Get group invite
  result = api_instance.get_group_invite(group_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->get_group_invite: #{e}"
end
```

#### Using the get_group_invite_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GroupInvite>, Integer, Hash)> get_group_invite_with_http_info(group_id)

```ruby
begin
  # Get group invite
  data, status_code, headers = api_instance.get_group_invite_with_http_info(group_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GroupInvite>
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->get_group_invite_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **group_id** | **String** | Group ID |  |

### Return type

[**GroupInvite**](GroupInvite.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_group_metadata_by_invite_code

> <GroupInfoByInviteCode> get_group_metadata_by_invite_code(invite_code)

Get group info by invite code

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

api_instance = OpenapiClient::GroupsApi.new
invite_code = 'invite_code_example' # String | Invite Code

begin
  # Get group info by invite code
  result = api_instance.get_group_metadata_by_invite_code(invite_code)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->get_group_metadata_by_invite_code: #{e}"
end
```

#### Using the get_group_metadata_by_invite_code_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GroupInfoByInviteCode>, Integer, Hash)> get_group_metadata_by_invite_code_with_http_info(invite_code)

```ruby
begin
  # Get group info by invite code
  data, status_code, headers = api_instance.get_group_metadata_by_invite_code_with_http_info(invite_code)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GroupInfoByInviteCode>
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->get_group_metadata_by_invite_code_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **invite_code** | **String** | Invite Code |  |

### Return type

[**GroupInfoByInviteCode**](GroupInfoByInviteCode.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_groups

> <GroupsList> get_groups(opts)

Get groups

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

api_instance = OpenapiClient::GroupsApi.new
opts = {
  count: 8.14, # Float | Count of objects to return
  offset: 8.14 # Float | Offset of objects to return
}

begin
  # Get groups
  result = api_instance.get_groups(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->get_groups: #{e}"
end
```

#### Using the get_groups_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GroupsList>, Integer, Hash)> get_groups_with_http_info(opts)

```ruby
begin
  # Get groups
  data, status_code, headers = api_instance.get_groups_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GroupsList>
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->get_groups_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **count** | **Float** | Count of objects to return | [optional][default to 100] |
| **offset** | **Float** | Offset of objects to return | [optional] |

### Return type

[**GroupsList**](GroupsList.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## leave_group

> <ResponseSuccess> leave_group(group_id)

Leave group

This method allows you to leave a group that you are a member of

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

api_instance = OpenapiClient::GroupsApi.new
group_id = 'group_id_example' # String | Group ID

begin
  # Leave group
  result = api_instance.leave_group(group_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->leave_group: #{e}"
end
```

#### Using the leave_group_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> leave_group_with_http_info(group_id)

```ruby
begin
  # Leave group
  data, status_code, headers = api_instance.leave_group_with_http_info(group_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->leave_group_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **group_id** | **String** | Group ID |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## promote_to_group_admin

> <ResponseSuccess> promote_to_group_admin(group_id, list_participants_request)

Promote to group admin

This method is responsible for promoting group members to admins, you can promote one or more members to admins

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

api_instance = OpenapiClient::GroupsApi.new
group_id = 'group_id_example' # String | Group ID
list_participants_request = OpenapiClient::ListParticipantsRequest.new({participants: ['participants_example']}) # ListParticipantsRequest | 

begin
  # Promote to group admin
  result = api_instance.promote_to_group_admin(group_id, list_participants_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->promote_to_group_admin: #{e}"
end
```

#### Using the promote_to_group_admin_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> promote_to_group_admin_with_http_info(group_id, list_participants_request)

```ruby
begin
  # Promote to group admin
  data, status_code, headers = api_instance.promote_to_group_admin_with_http_info(group_id, list_participants_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->promote_to_group_admin_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **group_id** | **String** | Group ID |  |
| **list_participants_request** | [**ListParticipantsRequest**](ListParticipantsRequest.md) |  |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## reject_group_applications_list

> <Array<GroupApplicationChange>> reject_group_applications_list(group_id, opts)

Reject group applications for listed users

This method returns the list with result of operation for each user

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

api_instance = OpenapiClient::GroupsApi.new
group_id = 'group_id_example' # String | Group ID
opts = {
  application_request: OpenapiClient::ApplicationRequest.new # ApplicationRequest | Chat ID list
}

begin
  # Reject group applications for listed users
  result = api_instance.reject_group_applications_list(group_id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->reject_group_applications_list: #{e}"
end
```

#### Using the reject_group_applications_list_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<GroupApplicationChange>>, Integer, Hash)> reject_group_applications_list_with_http_info(group_id, opts)

```ruby
begin
  # Reject group applications for listed users
  data, status_code, headers = api_instance.reject_group_applications_list_with_http_info(group_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<GroupApplicationChange>>
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->reject_group_applications_list_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **group_id** | **String** | Group ID |  |
| **application_request** | [**ApplicationRequest**](ApplicationRequest.md) | Chat ID list | [optional] |

### Return type

[**Array&lt;GroupApplicationChange&gt;**](GroupApplicationChange.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## remove_group_participant

> <ResponseSuccess> remove_group_participant(group_id, list_participants_request)

Remove group participant

This method is responsible for removing members of the group

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

api_instance = OpenapiClient::GroupsApi.new
group_id = 'group_id_example' # String | Group ID
list_participants_request = OpenapiClient::ListParticipantsRequest.new({participants: ['participants_example']}) # ListParticipantsRequest | 

begin
  # Remove group participant
  result = api_instance.remove_group_participant(group_id, list_participants_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->remove_group_participant: #{e}"
end
```

#### Using the remove_group_participant_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> remove_group_participant_with_http_info(group_id, list_participants_request)

```ruby
begin
  # Remove group participant
  data, status_code, headers = api_instance.remove_group_participant_with_http_info(group_id, list_participants_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->remove_group_participant_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **group_id** | **String** | Group ID |  |
| **list_participants_request** | [**ListParticipantsRequest**](ListParticipantsRequest.md) |  |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## revoke_group_invite

> <ResponseSuccess> revoke_group_invite(group_id)

Revoke group invite

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

api_instance = OpenapiClient::GroupsApi.new
group_id = 'group_id_example' # String | Group ID

begin
  # Revoke group invite
  result = api_instance.revoke_group_invite(group_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->revoke_group_invite: #{e}"
end
```

#### Using the revoke_group_invite_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> revoke_group_invite_with_http_info(group_id)

```ruby
begin
  # Revoke group invite
  data, status_code, headers = api_instance.revoke_group_invite_with_http_info(group_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->revoke_group_invite_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **group_id** | **String** | Group ID |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## send_group_invite

> <SentMessage> send_group_invite(invite_code, sender_group_invite_by_code)

Send group invite link

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

api_instance = OpenapiClient::GroupsApi.new
invite_code = 'invite_code_example' # String | Invite Code
sender_group_invite_by_code = OpenapiClient::SenderGroupInviteByCode.new({to: '1234567891@s.whatsapp.net'}) # SenderGroupInviteByCode | Message group invite

begin
  # Send group invite link
  result = api_instance.send_group_invite(invite_code, sender_group_invite_by_code)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->send_group_invite: #{e}"
end
```

#### Using the send_group_invite_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> send_group_invite_with_http_info(invite_code, sender_group_invite_by_code)

```ruby
begin
  # Send group invite link
  data, status_code, headers = api_instance.send_group_invite_with_http_info(invite_code, sender_group_invite_by_code)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->send_group_invite_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **invite_code** | **String** | Invite Code |  |
| **sender_group_invite_by_code** | [**SenderGroupInviteByCode**](SenderGroupInviteByCode.md) | Message group invite |  |

### Return type

[**SentMessage**](SentMessage.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## set_group_icon

> <ResponseSuccess> set_group_icon(group_id, body)

Set group icon

This method is reponsibible for changing a group image that already exists

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

api_instance = OpenapiClient::GroupsApi.new
group_id = 'group_id_example' # String | Group ID
body = File.new('/path/to/some/file') # File | 

begin
  # Set group icon
  result = api_instance.set_group_icon(group_id, body)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->set_group_icon: #{e}"
end
```

#### Using the set_group_icon_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> set_group_icon_with_http_info(group_id, body)

```ruby
begin
  # Set group icon
  data, status_code, headers = api_instance.set_group_icon_with_http_info(group_id, body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->set_group_icon_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **group_id** | **String** | Group ID |  |
| **body** | **File** |  |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: image/jpeg, image/png, application/json
- **Accept**: application/json


## update_group_info

> <ResponseSuccess> update_group_info(group_id, update_group_info_request)

Update group info

This method is responsible for changing the name and description of a group that already exists

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

api_instance = OpenapiClient::GroupsApi.new
group_id = 'group_id_example' # String | Group ID
update_group_info_request = OpenapiClient::UpdateGroupInfoRequest.new # UpdateGroupInfoRequest | 

begin
  # Update group info
  result = api_instance.update_group_info(group_id, update_group_info_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->update_group_info: #{e}"
end
```

#### Using the update_group_info_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> update_group_info_with_http_info(group_id, update_group_info_request)

```ruby
begin
  # Update group info
  data, status_code, headers = api_instance.update_group_info_with_http_info(group_id, update_group_info_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->update_group_info_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **group_id** | **String** | Group ID |  |
| **update_group_info_request** | [**UpdateGroupInfoRequest**](UpdateGroupInfoRequest.md) |  |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_group_setting

> <ResponseSuccess> update_group_setting(group_id, update_group_setting_request)

Update group setting

This method is responsible for changing the privacy settings for group

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

api_instance = OpenapiClient::GroupsApi.new
group_id = 'group_id_example' # String | Group ID
update_group_setting_request = OpenapiClient::UpdateGroupSettingRequest.new({setting: 'send_messages', policy: 'anyone'}) # UpdateGroupSettingRequest | 

begin
  # Update group setting
  result = api_instance.update_group_setting(group_id, update_group_setting_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->update_group_setting: #{e}"
end
```

#### Using the update_group_setting_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> update_group_setting_with_http_info(group_id, update_group_setting_request)

```ruby
begin
  # Update group setting
  data, status_code, headers = api_instance.update_group_setting_with_http_info(group_id, update_group_setting_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling GroupsApi->update_group_setting_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **group_id** | **String** | Group ID |  |
| **update_group_setting_request** | [**UpdateGroupSettingRequest**](UpdateGroupSettingRequest.md) |  |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

