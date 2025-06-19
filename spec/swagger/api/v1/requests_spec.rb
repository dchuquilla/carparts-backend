
require 'swagger_helper'

describe "Requests", type: :request do
  let(:request) { create(:request, user_phone: "593111111111") }
  let(:requests_list) { create_list(:request, 5, user_phone: "123456789") }
  let(:valid_attributes) { {
    user_phone: "MyString",
    user_name: nil,
    user_email: nil,
    part_name: "PART NAME",
    part_brand: "PART BRAND",
    part_model: "PART MODEL",
    part_year: 2025
  }}
  let(:invalid_attributes) { {
    user_phone: nil,
    user_name: nil,
    user_email: nil,
    part_name: nil,
    part_brand: nil,
    part_model: nil,
    part_year: nil
  }}
  let(:valid_headers) { {} }

  # Helper method to parse JSON responses
  def json_response
    JSON.parse(response.body)
  end

  path '/api/v1/requests' do
    before do
      request
      requests_list
    end

    get 'Retrieves all requests' do
      tags 'Requests'
      produces 'application/json'
      consumes 'application/json'

      builder = Schemas::RequestIndexSchema

      response(200, 'requests#index') do
        schema builder.response_payload

        before do |example|
          submit_request(example.metadata)
        end

        it 'returns all requests', :aggregate_failures do |example|
          expect(response).to have_http_status(:ok)
          expect(json_response.size).to eq(6)
          expect(json_response.first['part_name']).to eq('PART NAME')
        end
      end
    end

    get 'Retrieves a filtered list requests' do
      tags 'Requests'
      produces 'application/json'
      consumes 'application/json'

      builder = Schemas::RequestIndexSchema
      parameter name: "q[user_phone_eq]", in: :query, type: :string, description: 'Search by phone number', required: false
      parameter name: "q[part_brand_cont]", in: :query, type: :string, description: 'Search by part brand', required: false
      parameter name: "q[part_model_cont]", in: :query, type: :string, description: 'Search by part model', required: false
      parameter name: "q[part_year_eq]", in: :query, type: :integer, description: 'Search by part year', required: false

      response(200, 'requests#index') do
        schema builder.response_payload
        let("q[user_phone_eq]") { '593111111111' }

        before do |example|
          submit_request(example.metadata)
        end

        it 'returns a list of requests', :aggregate_failures do |example|
          expect(response).to have_http_status(:ok)
          expect(json_response.size).to eq(1)
          expect(json_response.first['part_name']).to eq('PART NAME')
        end
      end
    end

    post 'Creates a request' do
      tags 'Requests'
      produces 'application/json'
      consumes 'application/json'

      builder = Schemas::RequestCreateSchema

      parameter name: :params, in: :body, schema: builder.request_payload

      response(201, 'request#create') do
        schema builder.response_payload

        let(:params) { { request: valid_attributes } }

        before do |example|
          submit_request(example.metadata)
        end

        it 'creates a request', :aggregate_failures do |example|
          expect(response).to have_http_status(:created)
          expect(json_response['part_name']).to eq(valid_attributes[:part_name])
        end
      end
    end
  end

  path '/api/v1/requests/{id}' do
    get 'Retrieves a request' do
      tags 'Requests'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :id, in: :path, type: :string, description: 'Request ID'

      response(200, 'request#show') do
        schema Schemas::RequestCreateSchema.response_payload
        let(:id) { request.id }

        before do |example|
          submit_request(example.metadata)
        end

        it 'retrieves a request', :aggregate_failures do |example|
          expect(response).to have_http_status(:ok)
          expect(json_response['part_name']).to eq('PART NAME')
        end
      end
    end

    put 'Updates a request' do
      tags 'Requests'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :id, in: :path, type: :string, description: 'Request ID'
      parameter name: :params, in: :body, schema: Schemas::RequestCreateSchema.request_payload

      response(200, 'request#update') do
        schema Schemas::RequestCreateSchema.response_payload
        let(:id) { request.id }
        let(:params) { { request: { part_name: 'PART NAME 2', part_image: "https://part.img/image.jspeg" } } }

        before do |example|
          submit_request(example.metadata)
        end

        it 'updates a request', :aggregate_failures do |example|
          expect(response).to have_http_status(:ok)
          expect(json_response['part_name']).to eq('PART NAME 2')
          expect(json_response['part_image']).to eq("https://part.img/image.jspeg")
        end
      end
    end

    delete 'Deletes a request' do
      tags 'Requests'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :id, in: :path, type: :string, description: 'Request ID'

      response(204, 'request#destroy') do
        let(:id) { request.id }

        before do |example|
          submit_request(example.metadata)
        end

        it 'deletes a request' do |example|
          expect(response).to have_http_status(:no_content)
        end
      end
    end
  end
end
