require 'rails_helper'

RSpec.describe "Api::V1::Proposals", type: :request do
  let!(:user) { create(:user) }
  let!(:proposal1) { create(:proposal, user: user) }
  let!(:proposal2) { create(:proposal, user: user) }
  let(:credentials) { { user: { email: user.email, password: user.password } } }

  # Helper method to parse JSON responses
  def json_response
    JSON.parse(response.body)
  end

  before do
    sign_in_user(user, credentials)
  end

  describe "GET /index" do
    context "when no user_id is provided", :aggregate_failures do
      it "returns all proposals" do
        get api_v1_proposals_path, params: { request_id: proposal1.request_id }
        expect(response).to have_http_status(:success)
        expect(json_response.size).to eq(1)
      end
    end

    context "when a user_id is provided" do
      it "returns an empty array if no proposals exist for the user", :aggregate_failures do
        other_user = create(:user)
        get api_v1_proposals_path, params: { user_id: other_user.id }
        expect(response).to have_http_status(:success)
        expect(json_response).to be_empty
      end
    end
  end

  describe "GET /show" do
    it "returns the proposal with the specified ID", :aggregate_failures do
      get api_v1_proposal_path(proposal1)
      expect(response).to have_http_status(:success)
      expect(json_response['id']).to eq(proposal1.id)
      expect(json_response['user_id']).to eq(user.id)
    end

    it "returns a 404 if the proposal does not exist" do
      get api_v1_proposal_path(id: 9999) # Assuming this ID does not exist
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "POST /create" do
    let(:valid_attributes) do
      {
        proposal: {
          price: "100.00",
          currency: "USD",
          delivery_time_days: 5,
          warranty_months: 12,
          notes: "This is a test proposal",
          request_id: create(:request).id
        }
      }
    end

    it "creates a new proposal", :aggregate_failures do
      expect {
        post api_v1_proposals_path, params: valid_attributes
      }.to change(Proposal, :count).by(1)

      expect(response).to have_http_status(:created)
      expect(json_response['formatted_price']).to eq("USD 100.00")
      expect(json_response['user_id']).to eq(user.id)
    end

    it "returns errors for invalid attributes", :aggregate_failures do
      post api_v1_proposals_path, params: { proposal: { price: nil } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(json_response['errors']).to include("Price can't be blank")
    end
  end

  describe "PUT /update" do
    let(:valid_attributes) do
      {
        proposal: {
          price: "150.00",
          currency: "USD",
          delivery_time_days: 7,
          warranty_months: 18,
          notes: "Updated proposal notes"
        }
      }
    end

    it "updates the proposal if the user is the owner", :aggregate_failures do
      put api_v1_proposal_path(proposal1), params: valid_attributes

      expect(response).to have_http_status(:success)
      expect(json_response['formatted_price']).to eq("USD 150.00")
      expect(json_response['notes']).to eq("Updated proposal notes")
    end
  end

  describe "DELETE /destroy" do
    it "deletes the proposal if the user is the owner", :aggregate_failures do
      expect {
        delete api_v1_proposal_path(proposal1)
      }.to change(Proposal, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end
  end
end
