
require 'swagger_helper'

describe "Requests", type: :request do
  let(:request) { create(:request) }
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

        it 'returns all requests' do |example|
          data = JSON.parse(response.body)

          expect(response).to have_http_status(:ok)
          expect(data.size).to eq(6)
          expect(data.first['user_phone']).to eq('593111111111')
          expect(data.last['user_phone']).to eq('123456789')
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

        it 'returns a list of requests' do |example|
          data = JSON.parse(response.body)

          expect(response).to have_http_status(:ok)
          expect(data.size).to eq(1)
          expect(data.first['user_phone']).to eq('593111111111')
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

        it 'creates a request' do |example|
          data = JSON.parse(response.body)

          expect(response).to have_http_status(:created)
          expect(data['part_name']).to eq(valid_attributes[:part_name])
        end
      end
    end
  end

  # describe "GET /index" do
  #   it "renders a successful response" do
  #     Request.create! valid_attributes
  #     get api_v1_requests_url, headers: valid_headers, as: :json
  #     expect(response).to be_successful
  #   end
  # end

  # describe "GET /show" do
  #   it "renders a successful response" do
  #     request = Request.create! valid_attributes
  #     get api_v1_request_url(request), as: :json
  #     expect(response).to be_successful
  #   end
  # end

  # describe "POST /create" do
  #   context "with valid parameters" do
  #     it "creates a new Request" do
  #       expect {
  #         post api_v1_requests_url,
  #              params: { request: valid_attributes }, headers: valid_headers, as: :json
  #       }.to change(Request, :count).by(1)
  #     end

  #     it "renders a JSON response with the new request" do
  #       post api_v1_requests_url,
  #            params: { request: valid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:created)
  #       expect(response.content_type).to match(a_string_including("application/json"))
  #     end
  #   end

  #   context "with invalid parameters" do
  #     it "does not create a new Request" do
  #       expect {
  #         post api_v1_requests_url,
  #              params: { request: invalid_attributes }, as: :json
  #       }.to change(Request, :count).by(0)
  #     end

  #     it "renders a JSON response with errors for the new request" do
  #       post api_v1_requests_url,
  #            params: { request: invalid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to match(a_string_including("application/json"))
  #     end
  #   end
  # end

  # describe "PATCH /update" do
  #   context "with valid parameters" do
  #     let(:new_attributes) {
  #       {
  #       user_phone: "MyString",
  #       user_name: nil,
  #       user_email: nil,
  #       part_name: "PART NAME 2",
  #       part_brand: "PART BRAND 2",
  #       part_model: "PART MODEL 2",
  #       part_year: 2025
  #       }
  #     }

  #     it "updates the requested request" do
  #       request = Request.create! valid_attributes
  #       patch api_v1_request_url(request),
  #             params: { request: new_attributes }, headers: valid_headers, as: :json
  #       request.reload
  #       expect(request.part_name).to eq("PART NAME 2")
  #       expect(request.part_brand).to eq("PART BRAND 2")
  #       expect(request.part_model).to eq("PART MODEL 2")
  #     end

  #     it "renders a JSON response with the request" do
  #       request = Request.create! valid_attributes
  #       patch api_v1_request_url(request),
  #             params: { request: new_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:ok)
  #       expect(response.content_type).to match(a_string_including("application/json"))
  #     end
  #   end

  #   context "with invalid parameters" do
  #     it "renders a JSON response with errors for the request" do
  #       request = Request.create! valid_attributes
  #       patch api_v1_request_url(request),
  #             params: { request: invalid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to match(a_string_including("application/json"))
  #     end
  #   end
  # end

  # describe "DELETE /destroy" do
  #   it "destroys the requested request" do
  #     request = Request.create! valid_attributes
  #     expect {
  #       delete api_v1_request_url(request), headers: valid_headers, as: :json
  #     }.to change(Request, :count).by(-1)
  #   end
  # end
end
