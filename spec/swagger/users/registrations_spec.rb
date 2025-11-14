require 'swagger_helper'

describe "Users::Registrations", type: :request do
  let(:valid_attributes) { {
    user: {
      email: "test@example.com",
      password: "password",
      phone: "1234567890",
      store_name: "Test Store"
    }
  } }

  describe "POST /users" do
    context "with valid parameters" do
      it "creates a new user" do
        post "/users", params: valid_attributes
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters" do
      it "does not create a new user" do
        post "/users", params: { user: { email: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
