
require 'swagger_helper'

describe "Requests", type: :request do
  let(:request) { create(:request)}
  let(:valid_attributes) {
    {
    user_phone: "MyString",
    user_name: nil,
    user_email: nil,
    part_name: "PART NAME",
    part_brand: "PART BRAND",
    part_model: "PART MODEL",
    part_year: 2025
    }
  }
  let(:invalid_attributes) {
    {
    user_phone: nil,
    user_name: nil,
    user_email: nil,
    part_name: nil,
    part_brand: nil,
    part_model: nil,
    part_year: nil
    }
  }
  let(:valid_headers) {
    {}
  }

  path '/api/v1/requests' do
    get 'Retrieves all requests' do
      tags 'Requests'
      produces 'application/json'
      consumes 'application/json'

      response(200, 'requests#index') do
        run_test!
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
