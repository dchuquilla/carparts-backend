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
        get api_v1_proposals_path
        expect(response).to have_http_status(:success)
        expect(json_response.size).to eq(2)
      end
    end

    context "when a user_id is provided" do
      it "returns proposals for the specified user", :aggregate_failures do
        get api_v1_proposals_path, params: { user_id: user.id }
        expect(response).to have_http_status(:success)
        expect(json_response.size).to eq(2)
      end

      it "returns an empty array if no proposals exist for the user", :aggregate_failures do
        other_user = create(:user)
        get api_v1_proposals_path, params: { user_id: other_user.id }
        expect(response).to have_http_status(:success)
        expect(json_response).to be_empty
      end
    end
  end
end
