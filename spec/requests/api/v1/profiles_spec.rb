require 'rails_helper'

RSpec.describe "Api::V1::Profiles", type: :request do
  describe "GET /show" do
    let(:user) { create(:user) }
    let(:credentials) { { user: { email: user.email, password: user.password } } }

    before do
      sign_in_user(user, credentials)
    end

    it "returns http success" do
      get "/api/v1/profile"
      expect(response).to have_http_status(:success)
    end
  end
end
