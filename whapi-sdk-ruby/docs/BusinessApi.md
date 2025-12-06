# OpenapiClient::BusinessApi

All URIs are relative to *https://gate.whapi.cloud*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_collection**](BusinessApi.md#create_collection) | **POST** /business/collections | Create collection |
| [**create_product**](BusinessApi.md#create_product) | **POST** /business/products | Create product |
| [**delete_collection**](BusinessApi.md#delete_collection) | **DELETE** /business/collections/{CollectionID} | Delete collection |
| [**delete_product**](BusinessApi.md#delete_product) | **DELETE** /business/products/{ProductID} | Delete product |
| [**edit_business_profile**](BusinessApi.md#edit_business_profile) | **POST** /business | Edit your Business Profile |
| [**edit_collection**](BusinessApi.md#edit_collection) | **PATCH** /business/collections/{CollectionID} | Edit collection |
| [**get_business_profile**](BusinessApi.md#get_business_profile) | **GET** /business | Get business profile |
| [**get_collection**](BusinessApi.md#get_collection) | **GET** /business/collections/{CollectionID} | Get collection |
| [**get_collections_list**](BusinessApi.md#get_collections_list) | **GET** /business/collections | Get collections |
| [**get_contact_products**](BusinessApi.md#get_contact_products) | **GET** /business/{ContactID}/products | Get products by Contact ID |
| [**get_order_items**](BusinessApi.md#get_order_items) | **GET** /business/orders/{OrderID} | Get order items |
| [**get_product**](BusinessApi.md#get_product) | **GET** /business/products/{ProductID} | Get product |
| [**get_products**](BusinessApi.md#get_products) | **GET** /business/products | Get products |
| [**send_catalog**](BusinessApi.md#send_catalog) | **POST** /business/catalogs/{ContactID} | Send catalog by Contact ID (phone number) |
| [**send_product**](BusinessApi.md#send_product) | **POST** /business/products/{ProductID} | Send product |
| [**update_product**](BusinessApi.md#update_product) | **PATCH** /business/products/{ProductID} | Update product |


## create_collection

> <BusinessCollectionEditResult> create_collection(business_collection_create)

Create collection

Create business collection

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

api_instance = OpenapiClient::BusinessApi.new
business_collection_create = OpenapiClient::BusinessCollectionCreate.new({name: 'name_example', products: ['products_example']}) # BusinessCollectionCreate | Business collection parameters

begin
  # Create collection
  result = api_instance.create_collection(business_collection_create)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->create_collection: #{e}"
end
```

#### Using the create_collection_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BusinessCollectionEditResult>, Integer, Hash)> create_collection_with_http_info(business_collection_create)

```ruby
begin
  # Create collection
  data, status_code, headers = api_instance.create_collection_with_http_info(business_collection_create)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BusinessCollectionEditResult>
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->create_collection_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **business_collection_create** | [**BusinessCollectionCreate**](BusinessCollectionCreate.md) | Business collection parameters |  |

### Return type

[**BusinessCollectionEditResult**](BusinessCollectionEditResult.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_product

> <Product> create_product(opts)

Create product

In this method you will be able to register a product in your catalog

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

api_instance = OpenapiClient::BusinessApi.new
opts = {
  product_create: OpenapiClient::ProductCreate.new({currency: OpenapiClient::Currency::USD, images: [OpenapiClient::GroupIconParametersMedia.new], name: 'name_example', description: 'description_example', price: 3.56}) # ProductCreate | Request body
}

begin
  # Create product
  result = api_instance.create_product(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->create_product: #{e}"
end
```

#### Using the create_product_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Product>, Integer, Hash)> create_product_with_http_info(opts)

```ruby
begin
  # Create product
  data, status_code, headers = api_instance.create_product_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Product>
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->create_product_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **product_create** | [**ProductCreate**](ProductCreate.md) | Request body | [optional] |

### Return type

[**Product**](Product.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_collection

> <ResponseSuccess> delete_collection(collection_id)

Delete collection

Method to delete business collection

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

api_instance = OpenapiClient::BusinessApi.new
collection_id = 'collection_id_example' # String | Collection ID

begin
  # Delete collection
  result = api_instance.delete_collection(collection_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->delete_collection: #{e}"
end
```

#### Using the delete_collection_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> delete_collection_with_http_info(collection_id)

```ruby
begin
  # Delete collection
  data, status_code, headers = api_instance.delete_collection_with_http_info(collection_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->delete_collection_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **collection_id** | **String** | Collection ID |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## delete_product

> <ResponseSuccess> delete_product(product_id)

Delete product

In this method you will be able to delete a product by its ID

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

api_instance = OpenapiClient::BusinessApi.new
product_id = 'product_id_example' # String | Product ID

begin
  # Delete product
  result = api_instance.delete_product(product_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->delete_product: #{e}"
end
```

#### Using the delete_product_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> delete_product_with_http_info(product_id)

```ruby
begin
  # Delete product
  data, status_code, headers = api_instance.delete_product_with_http_info(product_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->delete_product_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **product_id** | **String** | Product ID |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## edit_business_profile

> <ResponseSuccess> edit_business_profile(opts)

Edit your Business Profile

The method allows you to edit information of your WhatsApp Business profile

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

api_instance = OpenapiClient::BusinessApi.new
opts = {
  business_profile_custom: OpenapiClient::BusinessProfileCustom.new # BusinessProfileCustom | Request body
}

begin
  # Edit your Business Profile
  result = api_instance.edit_business_profile(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->edit_business_profile: #{e}"
end
```

#### Using the edit_business_profile_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> edit_business_profile_with_http_info(opts)

```ruby
begin
  # Edit your Business Profile
  data, status_code, headers = api_instance.edit_business_profile_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->edit_business_profile_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **business_profile_custom** | [**BusinessProfileCustom**](BusinessProfileCustom.md) | Request body | [optional] |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## edit_collection

> <BusinessCollectionEditResult> edit_collection(collection_id, business_collection_edit)

Edit collection

With this method you will be able to edit business collection

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

api_instance = OpenapiClient::BusinessApi.new
collection_id = 'collection_id_example' # String | Collection ID
business_collection_edit = OpenapiClient::BusinessCollectionEdit.new # BusinessCollectionEdit | Business collection edit parameters

begin
  # Edit collection
  result = api_instance.edit_collection(collection_id, business_collection_edit)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->edit_collection: #{e}"
end
```

#### Using the edit_collection_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BusinessCollectionEditResult>, Integer, Hash)> edit_collection_with_http_info(collection_id, business_collection_edit)

```ruby
begin
  # Edit collection
  data, status_code, headers = api_instance.edit_collection_with_http_info(collection_id, business_collection_edit)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BusinessCollectionEditResult>
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->edit_collection_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **collection_id** | **String** | Collection ID |  |
| **business_collection_edit** | [**BusinessCollectionEdit**](BusinessCollectionEdit.md) | Business collection edit parameters |  |

### Return type

[**BusinessCollectionEditResult**](BusinessCollectionEditResult.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_business_profile

> <BusinessProfile> get_business_profile

Get business profile

The method allows you to get information about your WhatsApp Business profile

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

api_instance = OpenapiClient::BusinessApi.new

begin
  # Get business profile
  result = api_instance.get_business_profile
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->get_business_profile: #{e}"
end
```

#### Using the get_business_profile_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BusinessProfile>, Integer, Hash)> get_business_profile_with_http_info

```ruby
begin
  # Get business profile
  data, status_code, headers = api_instance.get_business_profile_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BusinessProfile>
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->get_business_profile_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**BusinessProfile**](BusinessProfile.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_collection

> <BusinessCollection> get_collection(collection_id)

Get collection

With this method you will be able to get business collection

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

api_instance = OpenapiClient::BusinessApi.new
collection_id = 'collection_id_example' # String | Collection ID

begin
  # Get collection
  result = api_instance.get_collection(collection_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->get_collection: #{e}"
end
```

#### Using the get_collection_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BusinessCollection>, Integer, Hash)> get_collection_with_http_info(collection_id)

```ruby
begin
  # Get collection
  data, status_code, headers = api_instance.get_collection_with_http_info(collection_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BusinessCollection>
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->get_collection_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **collection_id** | **String** | Collection ID |  |

### Return type

[**BusinessCollection**](BusinessCollection.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_collections_list

> <BusinessCollectionList> get_collections_list(opts)

Get collections

With this method you will be able to get the collections list from a Whatsapp Business catalog

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

api_instance = OpenapiClient::BusinessApi.new
opts = {
  count: 8.14, # Float | Count of objects to return
  offset: 8.14 # Float | Offset of objects to return
}

begin
  # Get collections
  result = api_instance.get_collections_list(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->get_collections_list: #{e}"
end
```

#### Using the get_collections_list_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BusinessCollectionList>, Integer, Hash)> get_collections_list_with_http_info(opts)

```ruby
begin
  # Get collections
  data, status_code, headers = api_instance.get_collections_list_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BusinessCollectionList>
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->get_collections_list_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **count** | **Float** | Count of objects to return | [optional][default to 100] |
| **offset** | **Float** | Offset of objects to return | [optional] |

### Return type

[**BusinessCollectionList**](BusinessCollectionList.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_contact_products

> <ProductsList> get_contact_products(contact_id, opts)

Get products by Contact ID

This method allows you to get the catalog and products by [Chat ID](https://support.whapi.cloud/help-desk/faq/chat-id.-what-is-it-and-how-to-get-it), even if it is not in your contact list

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

api_instance = OpenapiClient::BusinessApi.new
contact_id = 'contact_id_example' # String | Contact ID
opts = {
  count: 8.14, # Float | Count of objects to return
  offset: 8.14 # Float | Offset of objects to return
}

begin
  # Get products by Contact ID
  result = api_instance.get_contact_products(contact_id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->get_contact_products: #{e}"
end
```

#### Using the get_contact_products_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ProductsList>, Integer, Hash)> get_contact_products_with_http_info(contact_id, opts)

```ruby
begin
  # Get products by Contact ID
  data, status_code, headers = api_instance.get_contact_products_with_http_info(contact_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ProductsList>
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->get_contact_products_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **contact_id** | **String** | Contact ID |  |
| **count** | **Float** | Count of objects to return | [optional][default to 100] |
| **offset** | **Float** | Offset of objects to return | [optional] |

### Return type

[**ProductsList**](ProductsList.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_order_items

> <OrderItems> get_order_items(order_id, opts)

Get order items

The method allows you to get information about the items in the shopping cart sent to you in messages. Note! Use the token as a Query (as in a get request). [More details in the knowledge base](https://support.whapi.cloud/help-desk/receiving/http-api/get-order-items)

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

api_instance = OpenapiClient::BusinessApi.new
order_id = 'order_id_example' # String | Order ID
opts = {
  order_token: 'order_token_example' # String | Base64 token from order for receiving information
}

begin
  # Get order items
  result = api_instance.get_order_items(order_id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->get_order_items: #{e}"
end
```

#### Using the get_order_items_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<OrderItems>, Integer, Hash)> get_order_items_with_http_info(order_id, opts)

```ruby
begin
  # Get order items
  data, status_code, headers = api_instance.get_order_items_with_http_info(order_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <OrderItems>
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->get_order_items_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **order_id** | **String** | Order ID |  |
| **order_token** | **String** | Base64 token from order for receiving information | [optional] |

### Return type

[**OrderItems**](OrderItems.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_product

> <Product> get_product(product_id)

Get product

In this method you will be able to get your product by its ID

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

api_instance = OpenapiClient::BusinessApi.new
product_id = 'product_id_example' # String | Product ID

begin
  # Get product
  result = api_instance.get_product(product_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->get_product: #{e}"
end
```

#### Using the get_product_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Product>, Integer, Hash)> get_product_with_http_info(product_id)

```ruby
begin
  # Get product
  data, status_code, headers = api_instance.get_product_with_http_info(product_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Product>
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->get_product_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **product_id** | **String** | Product ID |  |

### Return type

[**Product**](Product.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_products

> <ProductsList> get_products(opts)

Get products

With this method you will be able to get the products from a Whatsapp Business catalog

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

api_instance = OpenapiClient::BusinessApi.new
opts = {
  count: 8.14, # Float | Count of objects to return
  offset: 8.14 # Float | Offset of objects to return
}

begin
  # Get products
  result = api_instance.get_products(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->get_products: #{e}"
end
```

#### Using the get_products_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ProductsList>, Integer, Hash)> get_products_with_http_info(opts)

```ruby
begin
  # Get products
  data, status_code, headers = api_instance.get_products_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ProductsList>
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->get_products_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **count** | **Float** | Count of objects to return | [optional][default to 100] |
| **offset** | **Float** | Offset of objects to return | [optional] |

### Return type

[**ProductsList**](ProductsList.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## send_catalog

> <SentMessage> send_catalog(contact_id, sender_catalog_by_id)

Send catalog by Contact ID (phone number)

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

api_instance = OpenapiClient::BusinessApi.new
contact_id = 'contact_id_example' # String | Contact ID
sender_catalog_by_id = OpenapiClient::SenderCatalogByID.new({to: '1234567891@s.whatsapp.net'}) # SenderCatalogByID | Message catalog

begin
  # Send catalog by Contact ID (phone number)
  result = api_instance.send_catalog(contact_id, sender_catalog_by_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->send_catalog: #{e}"
end
```

#### Using the send_catalog_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> send_catalog_with_http_info(contact_id, sender_catalog_by_id)

```ruby
begin
  # Send catalog by Contact ID (phone number)
  data, status_code, headers = api_instance.send_catalog_with_http_info(contact_id, sender_catalog_by_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->send_catalog_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **contact_id** | **String** | Contact ID |  |
| **sender_catalog_by_id** | [**SenderCatalogByID**](SenderCatalogByID.md) | Message catalog |  |

### Return type

[**SentMessage**](SentMessage.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## send_product

> <SentMessage> send_product(product_id, sender_product_from_catalog)

Send product

The method is for sending an item from your catalog

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

api_instance = OpenapiClient::BusinessApi.new
product_id = 'product_id_example' # String | Product ID
sender_product_from_catalog = OpenapiClient::SenderProductFromCatalog.new({to: '1234567891@s.whatsapp.net'}) # SenderProductFromCatalog | Message product

begin
  # Send product
  result = api_instance.send_product(product_id, sender_product_from_catalog)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->send_product: #{e}"
end
```

#### Using the send_product_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SentMessage>, Integer, Hash)> send_product_with_http_info(product_id, sender_product_from_catalog)

```ruby
begin
  # Send product
  data, status_code, headers = api_instance.send_product_with_http_info(product_id, sender_product_from_catalog)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SentMessage>
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->send_product_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **product_id** | **String** | Product ID |  |
| **sender_product_from_catalog** | [**SenderProductFromCatalog**](SenderProductFromCatalog.md) | Message product |  |

### Return type

[**SentMessage**](SentMessage.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## update_product

> <Product> update_product(product_id, product_edit)

Update product

The *images* field is required and must contain all images

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

api_instance = OpenapiClient::BusinessApi.new
product_id = 'product_id_example' # String | Product ID
product_edit = OpenapiClient::ProductEdit.new({images: [OpenapiClient::GroupIconParametersMedia.new]}) # ProductEdit | Message product

begin
  # Update product
  result = api_instance.update_product(product_id, product_edit)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->update_product: #{e}"
end
```

#### Using the update_product_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Product>, Integer, Hash)> update_product_with_http_info(product_id, product_edit)

```ruby
begin
  # Update product
  data, status_code, headers = api_instance.update_product_with_http_info(product_id, product_edit)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Product>
rescue OpenapiClient::ApiError => e
  puts "Error when calling BusinessApi->update_product_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **product_id** | **String** | Product ID |  |
| **product_edit** | [**ProductEdit**](ProductEdit.md) | Message product |  |

### Return type

[**Product**](Product.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json

