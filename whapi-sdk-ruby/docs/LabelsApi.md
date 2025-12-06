# OpenapiClient::LabelsApi

All URIs are relative to *https://gate.whapi.cloud*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**add_label_association**](LabelsApi.md#add_label_association) | **POST** /labels/{LabelID}/{AssociationID} | Add label association |
| [**create_label**](LabelsApi.md#create_label) | **POST** /labels | Create label |
| [**delete_label_association**](LabelsApi.md#delete_label_association) | **DELETE** /labels/{LabelID}/{AssociationID} | Delete label association |
| [**get_label_associations**](LabelsApi.md#get_label_associations) | **GET** /labels/{LabelID} | Get objects associated with label |
| [**get_labels**](LabelsApi.md#get_labels) | **GET** /labels | Get labels |


## add_label_association

> <ResponseSuccess> add_label_association(label_id, association_id)

Add label association

Through this method, it is possible to assign a label to a chat in WhatsApp Business

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

api_instance = OpenapiClient::LabelsApi.new
label_id = 'label_id_example' # String | Label ID
association_id = nil # AddLabelAssociationAssociationIDParameter | Chat ID or Message ID for label association

begin
  # Add label association
  result = api_instance.add_label_association(label_id, association_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling LabelsApi->add_label_association: #{e}"
end
```

#### Using the add_label_association_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> add_label_association_with_http_info(label_id, association_id)

```ruby
begin
  # Add label association
  data, status_code, headers = api_instance.add_label_association_with_http_info(label_id, association_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling LabelsApi->add_label_association_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **label_id** | **String** | Label ID |  |
| **association_id** | [**AddLabelAssociationAssociationIDParameter**](.md) | Chat ID or Message ID for label association |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## create_label

> <ResponseSuccess> create_label(opts)

Create label

Create label

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

api_instance = OpenapiClient::LabelsApi.new
opts = {
  create_label: OpenapiClient::CreateLabel.new({id: 'id_example', name: 'name_example', color: 'salmon'}) # CreateLabel | 
}

begin
  # Create label
  result = api_instance.create_label(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling LabelsApi->create_label: #{e}"
end
```

#### Using the create_label_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> create_label_with_http_info(opts)

```ruby
begin
  # Create label
  data, status_code, headers = api_instance.create_label_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling LabelsApi->create_label_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_label** | [**CreateLabel**](CreateLabel.md) |  | [optional] |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_label_association

> <ResponseSuccess> delete_label_association(label_id, association_id)

Delete label association

Through this method, it is possible to remove the labels from a chat in WhatsApp Business

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

api_instance = OpenapiClient::LabelsApi.new
label_id = 'label_id_example' # String | Label ID
association_id = nil # AddLabelAssociationAssociationIDParameter | Chat ID or Message ID for label association

begin
  # Delete label association
  result = api_instance.delete_label_association(label_id, association_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling LabelsApi->delete_label_association: #{e}"
end
```

#### Using the delete_label_association_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> delete_label_association_with_http_info(label_id, association_id)

```ruby
begin
  # Delete label association
  data, status_code, headers = api_instance.delete_label_association_with_http_info(label_id, association_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling LabelsApi->delete_label_association_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **label_id** | **String** | Label ID |  |
| **association_id** | [**AddLabelAssociationAssociationIDParameter**](.md) | Chat ID or Message ID for label association |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_label_associations

> <LabelAssociations> get_label_associations(label_id)

Get objects associated with label

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

api_instance = OpenapiClient::LabelsApi.new
label_id = 'label_id_example' # String | Label ID

begin
  # Get objects associated with label
  result = api_instance.get_label_associations(label_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling LabelsApi->get_label_associations: #{e}"
end
```

#### Using the get_label_associations_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<LabelAssociations>, Integer, Hash)> get_label_associations_with_http_info(label_id)

```ruby
begin
  # Get objects associated with label
  data, status_code, headers = api_instance.get_label_associations_with_http_info(label_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <LabelAssociations>
rescue OpenapiClient::ApiError => e
  puts "Error when calling LabelsApi->get_label_associations_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **label_id** | **String** | Label ID |  |

### Return type

[**LabelAssociations**](LabelAssociations.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_labels

> <Array<Label>> get_labels

Get labels

In this method, you retrieve all your registered labels in your WhatsApp Business

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

api_instance = OpenapiClient::LabelsApi.new

begin
  # Get labels
  result = api_instance.get_labels
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling LabelsApi->get_labels: #{e}"
end
```

#### Using the get_labels_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<Label>>, Integer, Hash)> get_labels_with_http_info

```ruby
begin
  # Get labels
  data, status_code, headers = api_instance.get_labels_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<Label>>
rescue OpenapiClient::ApiError => e
  puts "Error when calling LabelsApi->get_labels_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**Array&lt;Label&gt;**](Label.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

