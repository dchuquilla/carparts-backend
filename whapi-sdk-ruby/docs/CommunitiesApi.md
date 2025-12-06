# OpenapiClient::CommunitiesApi

All URIs are relative to *https://gate.whapi.cloud*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**add_community_participant**](CommunitiesApi.md#add_community_participant) | **POST** /communities/{CommunityID}/participants | Add participants to community |
| [**change_community_settings**](CommunitiesApi.md#change_community_settings) | **PATCH** /communities/{CommunityID}/settings | Change community settings |
| [**create_community**](CommunitiesApi.md#create_community) | **POST** /communities | Create community |
| [**create_group_in_community**](CommunitiesApi.md#create_group_in_community) | **POST** /communities/{CommunityID}/createGroup | Create group in community |
| [**deactivate_community**](CommunitiesApi.md#deactivate_community) | **DELETE** /communities/{CommunityID} | Deactivate community |
| [**demote_community_participant**](CommunitiesApi.md#demote_community_participant) | **DELETE** /communities/{CommunityID}/admins | Demote participants to admin in community |
| [**get_communities**](CommunitiesApi.md#get_communities) | **GET** /communities | Get communities |
| [**get_community**](CommunitiesApi.md#get_community) | **GET** /communities/{CommunityID} | Get community |
| [**get_community_sub_groups**](CommunitiesApi.md#get_community_sub_groups) | **GET** /communities/{CommunityID}/subGroups | Get community subgroups |
| [**join_in_community_group**](CommunitiesApi.md#join_in_community_group) | **POST** /communities/{CommunityID}/{GroupID}/join | Join in community group |
| [**link_group_to_community**](CommunitiesApi.md#link_group_to_community) | **PUT** /communities/{CommunityID}/{GroupID} | Link group to community |
| [**promote_community_participant**](CommunitiesApi.md#promote_community_participant) | **PATCH** /communities/{CommunityID}/admins | Promote participants to admin in community |
| [**remove_community_participant**](CommunitiesApi.md#remove_community_participant) | **DELETE** /communities/{CommunityID}/participants | Remove participants from community |
| [**revoke_community_invite**](CommunitiesApi.md#revoke_community_invite) | **DELETE** /communities/{CommunityID}/revokeInviteUrl | Revoke community invite code |
| [**unlink_group_from_community**](CommunitiesApi.md#unlink_group_from_community) | **DELETE** /communities/{CommunityID}/{GroupID} | Unlink group from community |


## add_community_participant

> <ResponseListParticipants> add_community_participant(community_id, list_participants_request)

Add participants to community

This method is responsible for add participants community.

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

api_instance = OpenapiClient::CommunitiesApi.new
community_id = 'community_id_example' # String | Community ID
list_participants_request = OpenapiClient::ListParticipantsRequest.new({participants: ['participants_example']}) # ListParticipantsRequest | 

begin
  # Add participants to community
  result = api_instance.add_community_participant(community_id, list_participants_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->add_community_participant: #{e}"
end
```

#### Using the add_community_participant_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseListParticipants>, Integer, Hash)> add_community_participant_with_http_info(community_id, list_participants_request)

```ruby
begin
  # Add participants to community
  data, status_code, headers = api_instance.add_community_participant_with_http_info(community_id, list_participants_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseListParticipants>
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->add_community_participant_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **community_id** | **String** | Community ID |  |
| **list_participants_request** | [**ListParticipantsRequest**](ListParticipantsRequest.md) |  |  |

### Return type

[**ResponseListParticipants**](ResponseListParticipants.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## change_community_settings

> <ResponseSuccess> change_community_settings(community_id, change_community_settings_request)

Change community settings

This method is responsible for change a community settings.

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

api_instance = OpenapiClient::CommunitiesApi.new
community_id = 'community_id_example' # String | Community ID
change_community_settings_request = OpenapiClient::ChangeCommunitySettingsRequest.new({setting: 'modify_groups', policy: 'anyone'}) # ChangeCommunitySettingsRequest | Community change settings data

begin
  # Change community settings
  result = api_instance.change_community_settings(community_id, change_community_settings_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->change_community_settings: #{e}"
end
```

#### Using the change_community_settings_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> change_community_settings_with_http_info(community_id, change_community_settings_request)

```ruby
begin
  # Change community settings
  data, status_code, headers = api_instance.change_community_settings_with_http_info(community_id, change_community_settings_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->change_community_settings_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **community_id** | **String** | Community ID |  |
| **change_community_settings_request** | [**ChangeCommunitySettingsRequest**](ChangeCommunitySettingsRequest.md) | Community change settings data |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_community

> <Group> create_community(create_community_request)

Create community

This method is responsible for creating a community. [Learn more about the nuances of community:](https://support.whapi.cloud/help-desk/communities/introduction)

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

api_instance = OpenapiClient::CommunitiesApi.new
create_community_request = OpenapiClient::CreateCommunityRequest.new({subject: 'subject_example', description: 'description_example'}) # CreateCommunityRequest | Community data

begin
  # Create community
  result = api_instance.create_community(create_community_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->create_community: #{e}"
end
```

#### Using the create_community_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Group>, Integer, Hash)> create_community_with_http_info(create_community_request)

```ruby
begin
  # Create community
  data, status_code, headers = api_instance.create_community_with_http_info(create_community_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Group>
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->create_community_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_community_request** | [**CreateCommunityRequest**](CreateCommunityRequest.md) | Community data |  |

### Return type

[**Group**](Group.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_group_in_community

> <Group> create_group_in_community(community_id, create_group_in_community_request)

Create group in community

This method is responsible for creating a group in community. [Learn more about the nuances of community:](https://support.whapi.cloud/help-desk/communities/introduction)

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

api_instance = OpenapiClient::CommunitiesApi.new
community_id = 'community_id_example' # String | Community ID
create_group_in_community_request = OpenapiClient::CreateGroupInCommunityRequest.new({participants: ['participants_example'], subject: 'subject_example'}) # CreateGroupInCommunityRequest | Group data

begin
  # Create group in community
  result = api_instance.create_group_in_community(community_id, create_group_in_community_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->create_group_in_community: #{e}"
end
```

#### Using the create_group_in_community_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Group>, Integer, Hash)> create_group_in_community_with_http_info(community_id, create_group_in_community_request)

```ruby
begin
  # Create group in community
  data, status_code, headers = api_instance.create_group_in_community_with_http_info(community_id, create_group_in_community_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Group>
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->create_group_in_community_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **community_id** | **String** | Community ID |  |
| **create_group_in_community_request** | [**CreateGroupInCommunityRequest**](CreateGroupInCommunityRequest.md) | Group data |  |

### Return type

[**Group**](Group.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## deactivate_community

> <ResponseSuccess> deactivate_community(community_id)

Deactivate community

This method is responsible for deactivate community.

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

api_instance = OpenapiClient::CommunitiesApi.new
community_id = 'community_id_example' # String | Community ID

begin
  # Deactivate community
  result = api_instance.deactivate_community(community_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->deactivate_community: #{e}"
end
```

#### Using the deactivate_community_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> deactivate_community_with_http_info(community_id)

```ruby
begin
  # Deactivate community
  data, status_code, headers = api_instance.deactivate_community_with_http_info(community_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->deactivate_community_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **community_id** | **String** | Community ID |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## demote_community_participant

> <ResponseListParticipants> demote_community_participant(community_id, list_participants_request)

Demote participants to admin in community

This method is responsible for demote participants to admin in community.

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

api_instance = OpenapiClient::CommunitiesApi.new
community_id = 'community_id_example' # String | Community ID
list_participants_request = OpenapiClient::ListParticipantsRequest.new({participants: ['participants_example']}) # ListParticipantsRequest | 

begin
  # Demote participants to admin in community
  result = api_instance.demote_community_participant(community_id, list_participants_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->demote_community_participant: #{e}"
end
```

#### Using the demote_community_participant_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseListParticipants>, Integer, Hash)> demote_community_participant_with_http_info(community_id, list_participants_request)

```ruby
begin
  # Demote participants to admin in community
  data, status_code, headers = api_instance.demote_community_participant_with_http_info(community_id, list_participants_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseListParticipants>
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->demote_community_participant_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **community_id** | **String** | Community ID |  |
| **list_participants_request** | [**ListParticipantsRequest**](ListParticipantsRequest.md) |  |  |

### Return type

[**ResponseListParticipants**](ResponseListParticipants.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_communities

> <GroupsList> get_communities(opts)

Get communities

This method is responsible for get a communities. [Learn more about the nuances of community:](https://support.whapi.cloud/help-desk/communities/introduction)

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

api_instance = OpenapiClient::CommunitiesApi.new
opts = {
  count: 8.14, # Float | Count of objects to return
  offset: 8.14 # Float | Offset of objects to return
}

begin
  # Get communities
  result = api_instance.get_communities(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->get_communities: #{e}"
end
```

#### Using the get_communities_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GroupsList>, Integer, Hash)> get_communities_with_http_info(opts)

```ruby
begin
  # Get communities
  data, status_code, headers = api_instance.get_communities_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GroupsList>
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->get_communities_with_http_info: #{e}"
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


## get_community

> <Group> get_community(community_id)

Get community

This method is responsible for get a community. [Learn more about the nuances of community:](https://support.whapi.cloud/help-desk/communities/introduction)

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

api_instance = OpenapiClient::CommunitiesApi.new
community_id = 'community_id_example' # String | Community ID

begin
  # Get community
  result = api_instance.get_community(community_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->get_community: #{e}"
end
```

#### Using the get_community_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Group>, Integer, Hash)> get_community_with_http_info(community_id)

```ruby
begin
  # Get community
  data, status_code, headers = api_instance.get_community_with_http_info(community_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Group>
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->get_community_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **community_id** | **String** | Community ID |  |

### Return type

[**Group**](Group.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_community_sub_groups

> <CommunitySubGroups> get_community_sub_groups(community_id)

Get community subgroups

This method is responsible for get a community subgroups. [Learn more about the nuances of community:](https://support.whapi.cloud/help-desk/communities/introduction)

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

api_instance = OpenapiClient::CommunitiesApi.new
community_id = 'community_id_example' # String | Community ID

begin
  # Get community subgroups
  result = api_instance.get_community_sub_groups(community_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->get_community_sub_groups: #{e}"
end
```

#### Using the get_community_sub_groups_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CommunitySubGroups>, Integer, Hash)> get_community_sub_groups_with_http_info(community_id)

```ruby
begin
  # Get community subgroups
  data, status_code, headers = api_instance.get_community_sub_groups_with_http_info(community_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CommunitySubGroups>
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->get_community_sub_groups_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **community_id** | **String** | Community ID |  |

### Return type

[**CommunitySubGroups**](CommunitySubGroups.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## join_in_community_group

> <ResponseSuccess> join_in_community_group(community_id, group_id)

Join in community group

This method is responsible for join in community group. [Learn more about the nuances of community:](https://support.whapi.cloud/help-desk/communities/introduction)

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

api_instance = OpenapiClient::CommunitiesApi.new
community_id = 'community_id_example' # String | Community ID
group_id = 'group_id_example' # String | Group ID

begin
  # Join in community group
  result = api_instance.join_in_community_group(community_id, group_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->join_in_community_group: #{e}"
end
```

#### Using the join_in_community_group_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> join_in_community_group_with_http_info(community_id, group_id)

```ruby
begin
  # Join in community group
  data, status_code, headers = api_instance.join_in_community_group_with_http_info(community_id, group_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->join_in_community_group_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **community_id** | **String** | Community ID |  |
| **group_id** | **String** | Group ID |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## link_group_to_community

> <ResponseSuccess> link_group_to_community(community_id, group_id)

Link group to community

This method is responsible for link group to community.

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

api_instance = OpenapiClient::CommunitiesApi.new
community_id = 'community_id_example' # String | Community ID
group_id = 'group_id_example' # String | Group ID

begin
  # Link group to community
  result = api_instance.link_group_to_community(community_id, group_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->link_group_to_community: #{e}"
end
```

#### Using the link_group_to_community_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> link_group_to_community_with_http_info(community_id, group_id)

```ruby
begin
  # Link group to community
  data, status_code, headers = api_instance.link_group_to_community_with_http_info(community_id, group_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->link_group_to_community_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **community_id** | **String** | Community ID |  |
| **group_id** | **String** | Group ID |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## promote_community_participant

> <ResponseListParticipants> promote_community_participant(community_id, list_participants_request)

Promote participants to admin in community

This method is responsible for promote participants to admin in community.

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

api_instance = OpenapiClient::CommunitiesApi.new
community_id = 'community_id_example' # String | Community ID
list_participants_request = OpenapiClient::ListParticipantsRequest.new({participants: ['participants_example']}) # ListParticipantsRequest | 

begin
  # Promote participants to admin in community
  result = api_instance.promote_community_participant(community_id, list_participants_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->promote_community_participant: #{e}"
end
```

#### Using the promote_community_participant_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseListParticipants>, Integer, Hash)> promote_community_participant_with_http_info(community_id, list_participants_request)

```ruby
begin
  # Promote participants to admin in community
  data, status_code, headers = api_instance.promote_community_participant_with_http_info(community_id, list_participants_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseListParticipants>
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->promote_community_participant_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **community_id** | **String** | Community ID |  |
| **list_participants_request** | [**ListParticipantsRequest**](ListParticipantsRequest.md) |  |  |

### Return type

[**ResponseListParticipants**](ResponseListParticipants.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## remove_community_participant

> <ResponseListParticipants> remove_community_participant(community_id, list_participants_request)

Remove participants from community

This method is responsible for remove paricipants from community.

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

api_instance = OpenapiClient::CommunitiesApi.new
community_id = 'community_id_example' # String | Community ID
list_participants_request = OpenapiClient::ListParticipantsRequest.new({participants: ['participants_example']}) # ListParticipantsRequest | 

begin
  # Remove participants from community
  result = api_instance.remove_community_participant(community_id, list_participants_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->remove_community_participant: #{e}"
end
```

#### Using the remove_community_participant_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseListParticipants>, Integer, Hash)> remove_community_participant_with_http_info(community_id, list_participants_request)

```ruby
begin
  # Remove participants from community
  data, status_code, headers = api_instance.remove_community_participant_with_http_info(community_id, list_participants_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseListParticipants>
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->remove_community_participant_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **community_id** | **String** | Community ID |  |
| **list_participants_request** | [**ListParticipantsRequest**](ListParticipantsRequest.md) |  |  |

### Return type

[**ResponseListParticipants**](ResponseListParticipants.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## revoke_community_invite

> <ResponseSuccess> revoke_community_invite(community_id)

Revoke community invite code

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

api_instance = OpenapiClient::CommunitiesApi.new
community_id = 'community_id_example' # String | Community ID

begin
  # Revoke community invite code
  result = api_instance.revoke_community_invite(community_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->revoke_community_invite: #{e}"
end
```

#### Using the revoke_community_invite_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> revoke_community_invite_with_http_info(community_id)

```ruby
begin
  # Revoke community invite code
  data, status_code, headers = api_instance.revoke_community_invite_with_http_info(community_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->revoke_community_invite_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **community_id** | **String** | Community ID |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## unlink_group_from_community

> <ResponseSuccess> unlink_group_from_community(community_id, group_id)

Unlink group from community

This method is responsible for unlink group from community.

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

api_instance = OpenapiClient::CommunitiesApi.new
community_id = 'community_id_example' # String | Community ID
group_id = 'group_id_example' # String | Group ID

begin
  # Unlink group from community
  result = api_instance.unlink_group_from_community(community_id, group_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->unlink_group_from_community: #{e}"
end
```

#### Using the unlink_group_from_community_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> unlink_group_from_community_with_http_info(community_id, group_id)

```ruby
begin
  # Unlink group from community
  data, status_code, headers = api_instance.unlink_group_from_community_with_http_info(community_id, group_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling CommunitiesApi->unlink_group_from_community_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **community_id** | **String** | Community ID |  |
| **group_id** | **String** | Group ID |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

