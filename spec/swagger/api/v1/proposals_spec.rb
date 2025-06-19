require 'swagger_helper'
require "devise/jwt/test_helpers"

describe "Proposals", type: :request do
  let(:user) { create(:user) }
  let!(:proposals_user) { create_list(:proposal, 5, user: user) }
  let!(:proposals) { create_list(:proposal, 15) }
  let(:credentials) { { user: { email: user.email, password: user.password } } }

  # Helper method to parse JSON responses
  def json_response
    JSON.parse(response.body)
  end

  before do
    sign_in_user(user, credentials)
  end

  path '/api/v1/proposals' do
    get 'Retrieves all proposals or proposals for a specific user' do
      tags 'Proposals'
      produces 'application/json'
      consumes 'application/json'
      security [bearerAuth: []]

      parameter name: :user_id, in: :query, type: :integer, description: 'Filter proposals by user ID'

      response(200, 'proposals#index') do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   price: { type: :string },
                   currency: { type: :string },
                   delivery_time_days: { type: :integer },
                   warranty_months: { type: :integer },
                   notes: { type: :string },
                   status: { type: :string, nullable: true },
                   formatted_price: { type: :string },
                 },
                 required: %w[id price currency delivery_time_days warranty_months notes status formatted_price]
               }
        let(:user_id) { user.id }

        before do |example|
          proposals_user
          proposals
          submit_request(example.metadata)
        end

        it 'returns all proposals or filtered by user ID', :aggregate_failures do |example|
          expect(response).to have_http_status(:ok)
          expect(json_response).to be_an(Array)
        end
      end
    end

    get 'Retrieves all proposals' do
      tags 'Proposals'
      produces 'application/json'
      consumes 'application/json'
      security [bearerAuth: []]

      response(200, 'proposals#index') do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   price: { type: :string },
                   currency: { type: :string },
                   delivery_time_days: { type: :integer },
                   warranty_months: { type: :integer },
                   notes: { type: :string },
                   status: { type: :string, nullable: true },
                   formatted_price: { type: :string },
                 },
                 required: %w[id price currency delivery_time_days warranty_months notes status formatted_price]
               }

        before do |example|
          submit_request(example.metadata)
        end

        it 'returns all proposals', :aggregate_failures do |example|
          expect(response).to have_http_status(:ok)
          expect(json_response).to be_an(Array)
        end
      end
    end

    post 'Creates a new proposal' do
      tags 'Proposals'
      produces 'application/json'
      consumes 'application/json'
      security [bearerAuth: []]

      parameter name: :proposal, in: :body, schema: {
        type: :object,
        properties: {
          price: { type: :string },
          currency: { type: :string },
          delivery_time_days: { type: :integer },
          warranty_months: { type: :integer },
          notes: { type: :string },
          request_id: { type: :integer }
        },
        required: %w[price currency delivery_time_days warranty_months notes request_id]
      }

      response(201, 'proposals#create') do
        let(:proposal) do
          {
            price: "123.72",
            currency: "USD",
            delivery_time_days: 5,
            warranty_months: 12,
            notes: "This is a test proposal",
            request_id: create(:request).id
          }
        end

        before do |example|
          submit_request(example.metadata)
        end

        it 'creates a new proposal', :aggregate_failures do |example|
          expect(response).to have_http_status(:created)
          expect(json_response['formatted_price']).to eq("USD 123.72")
          expect(json_response['currency']).to eq("USD")
        end
      end
    end
  end

  path '/api/v1/proposals/{id}' do
    parameter name: :id, in: :path, type: :integer, description: 'Proposal ID'

    get 'Retrieves a proposal by ID' do
      tags 'Proposals'
      produces 'application/json'
      consumes 'application/json'
      security [bearerAuth: []]

      response(200, 'proposals#show') do
        let(:id) { proposals_user.first.id }

        before do |example|
          submit_request(example.metadata)
        end

        it 'returns the proposal with the specified ID', :aggregate_failures do |example|
          expect(response).to have_http_status(:ok)
          expect(json_response['id']).to eq(proposals_user.first.id)
          expect(json_response['user_id']).to eq(user.id)
        end
      end

      response(404, 'Proposal not found') do
        let(:id) { 9999 } # Assuming this ID does not exist

        before do |example|
          submit_request(example.metadata)
        end

        it 'returns a 404 if the proposal does not exist' do |example|
          expect(response).to have_http_status(:not_found)
        end
      end
    end

    put 'Updates a proposal' do
      tags 'Proposals'
      produces 'application/json'
      consumes 'application/json'
      security [bearerAuth: []]

      parameter name: :proposal, in: :body, schema: {
        type: :object,
        properties: {
          price: { type: :string },
          currency: { type: :string },
          delivery_time_days: { type: :integer },
          warranty_months: { type: :integer },
          notes: { type: :string }
        },
        required: %w[price currency delivery_time_days warranty_months notes]
      }

      response(200, 'proposals#update') do
        let(:id) { proposals_user.first.id }
        let(:proposal) do
          {
            price: "159.37",
            currency: "USD",
            delivery_time_days: 7,
            warranty_months: 6,
            notes: "Updated proposal notes"
          }
        end

        before do |example|
          submit_request(example.metadata)
        end

        it 'updates the proposal', :aggregate_failures do |example|
          expect(response).to have_http_status(:ok)
          expect(json_response['formatted_price']).to eq("USD 159.37")
          expect(json_response['notes']).to eq("Updated proposal notes")
        end
      end

      response(422, 'Unprocessable Entity') do
        let(:id) { proposals_user.first.id }
        let(:proposal) { { price: nil } } # Invalid data

        before do |example|
          submit_request(example.metadata)
        end

        it 'returns validation errors' do |example|
          expect(response).to have_http_status(:unprocessable_entity)
          expect(json_response['errors']).to include("Price can't be blank")
        end
      end
    end

    delete 'Deletes a proposal' do
      tags 'Proposals'
      produces 'application/json'
      consumes 'application/json'
      security [bearerAuth: []]

      response(204, 'proposals#destroy') do
        let(:id) { proposals_user.first.id }

        before do |example|
          submit_request(example.metadata)
        end

        it 'deletes the proposal', :aggregate_failures do |example|
          expect(response).to have_http_status(:no_content)
          expect(Proposal.exists?(id)).to be_falsey
        end
      end

      response(401, 'Not authorized') do
        let(:id) { proposals.first.id } # Attempting to delete a proposal not owned by the user

        before do |example|
          submit_request(example.metadata)
        end

        it 'returns unauthorized error' do |example|
          expect(response).to have_http_status(:unauthorized)
          expect(json_response['error']).to eq('Not authorized')
        end
      end
    end
  end
end