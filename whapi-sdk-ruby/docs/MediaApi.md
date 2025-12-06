# OpenapiClient::MediaApi

All URIs are relative to *https://gate.whapi.cloud*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**delete_media**](MediaApi.md#delete_media) | **DELETE** /media/{MediaID} | Delete media |
| [**get_media**](MediaApi.md#get_media) | **GET** /media/{MediaID} | Get media |
| [**get_media_files**](MediaApi.md#get_media_files) | **GET** /media | Get media files |
| [**upload_media**](MediaApi.md#upload_media) | **POST** /media | Upload media |


## delete_media

> <ResponseSuccess> delete_media(media_id)

Delete media

Delete a file from the cloud by ID

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

api_instance = OpenapiClient::MediaApi.new
media_id = 'media_id_example' # String | Media ID

begin
  # Delete media
  result = api_instance.delete_media(media_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MediaApi->delete_media: #{e}"
end
```

#### Using the delete_media_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ResponseSuccess>, Integer, Hash)> delete_media_with_http_info(media_id)

```ruby
begin
  # Delete media
  data, status_code, headers = api_instance.delete_media_with_http_info(media_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ResponseSuccess>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MediaApi->delete_media_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **media_id** | **String** | Media ID |  |

### Return type

[**ResponseSuccess**](ResponseSuccess.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_media

> File get_media(media_id)

Get media

Receive a file from the cloud by ID. [Read more about file storage period.](https://support.whapi.cloud/help-desk/receiving/file-expiration-period)

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

api_instance = OpenapiClient::MediaApi.new
media_id = 'media_id_example' # String | Media ID

begin
  # Get media
  result = api_instance.get_media(media_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MediaApi->get_media: #{e}"
end
```

#### Using the get_media_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(File, Integer, Hash)> get_media_with_http_info(media_id)

```ruby
begin
  # Get media
  data, status_code, headers = api_instance.get_media_with_http_info(media_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => File
rescue OpenapiClient::ApiError => e
  puts "Error when calling MediaApi->get_media_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **media_id** | **String** | Media ID |  |

### Return type

**File**

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/pdf, application/msword, application/vnd.ms-powerpoint, application/vnd.ms-excel, text/plain, image/jpeg, image/png, audio/acc, audio/mp4, audio/amr, audio/mpeg, audio/ogg, codecs=opus, video/mp4, application/json


## get_media_files

> <MediaFilesList> get_media_files(opts)

Get media files

This method is responsible for returning all of your media files

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

api_instance = OpenapiClient::MediaApi.new
opts = {
  count: 8.14, # Float | Count of objects to return
  offset: 8.14, # Float | Offset of objects to return
  time_from: 8.14, # Float | Timestamp from which to get objects
  time_to: 8.14, # Float | Timestamp up to which to get objects
  sort: 'asc' # String | Order for items in request
}

begin
  # Get media files
  result = api_instance.get_media_files(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MediaApi->get_media_files: #{e}"
end
```

#### Using the get_media_files_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<MediaFilesList>, Integer, Hash)> get_media_files_with_http_info(opts)

```ruby
begin
  # Get media files
  data, status_code, headers = api_instance.get_media_files_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <MediaFilesList>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MediaApi->get_media_files_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **count** | **Float** | Count of objects to return | [optional][default to 100] |
| **offset** | **Float** | Offset of objects to return | [optional] |
| **time_from** | **Float** | Timestamp from which to get objects | [optional] |
| **time_to** | **Float** | Timestamp up to which to get objects | [optional] |
| **sort** | **String** | Order for items in request | [optional] |

### Return type

[**MediaFilesList**](MediaFilesList.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## upload_media

> <UploadMediaResponse> upload_media(body)

Upload media

This method is used to upload a file to cloud storage. In the response, you will receive the MediaID for the uploaded file, which can be used later, for example, to send media messages. The file type are determined by the file extension. [Read more about file storage period.](https://support.whapi.cloud/help-desk/receiving/file-expiration-period)

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

api_instance = OpenapiClient::MediaApi.new
body = File.new('/path/to/some/file') # File | 

begin
  # Upload media
  result = api_instance.upload_media(body)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling MediaApi->upload_media: #{e}"
end
```

#### Using the upload_media_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UploadMediaResponse>, Integer, Hash)> upload_media_with_http_info(body)

```ruby
begin
  # Upload media
  data, status_code, headers = api_instance.upload_media_with_http_info(body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UploadMediaResponse>
rescue OpenapiClient::ApiError => e
  puts "Error when calling MediaApi->upload_media_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **body** | **File** |  |  |

### Return type

[**UploadMediaResponse**](UploadMediaResponse.md)

### Authorization

[tokenAuth](../README.md#tokenAuth), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/pdf, application/msword, application/vnd.ms-powerpoint, application/vnd.ms-excel, text/plain, image/jpeg, image/png, audio/acc, audio/mp4, audio/amr, audio/mpeg, audio/ogg, codecs=opus, video/mp4, application/json
- **Accept**: application/json

