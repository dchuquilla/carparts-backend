# language: ruby
require "swagger_helper"
require "devise/jwt/test_helpers"

RSpec.describe "User Authentication API", type: :request do
  # Sessions endpoints
  path "/users/sign_in" do
    post "User sign in" do
      tags "Sessions"
      consumes "application/json"
      parameter name: :credentials, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[email password]
      }

      response "200", "Logged in successfully" do
        schema type: :object,
               properties: {
                 message: { type: :string },
                 user: {
                   type: :object,
                   properties: {
                     id: { type: :integer },
                     email: { type: :string }
                   }
                 }
               },
               required: %w[message user]

        let!(:user) { create(:user) }
        let(:credentials) { { user: { email: user.email, password: user.password } } }
        before do
          post "/users/sign_in", params: credentials.to_json, headers: { "Content-Type" => "application/json" }
        end
        it "returns user data" do
          expect(response.body).to include(user.email)
          expect(response.body).to include("Logged in successfully")
        end
      end

      response "401", "Invalid credentials" do
        let(:credentials) { { email: "invalid@example.com", password: "wrong" } }
        run_test!
      end
    end
  end

  path "/users/sign_out" do
    delete "User sign out" do
      tags "Sessions"
      consumes "application/json"
      produces "application/json"
      security [ bearer_auth: [] ]

      response "200", "Logged out successfully" do
        let(:user) { create(:user) }
        let(:authorization) { Devise::JWT::TestHelpers.auth_headers({}, user) }

        before do |example|
          authorization
          # submit_request(example.metadata.merge(headers: authorization))
          delete "/users/sign_out", headers: { "Authorization" => authorization["Authorization"] }
        end

        it "returns a valid 200 response" do |_example|
          body = JSON.parse(response.body)
          expect(response.status).to eq(200)
          expect(body["message"]).to eq("Logged out successfully")
        end
      end

      response "401", "User not found" do
        run_test!
      end
    end
  end


  # Registrations endpoints
  path "/users" do
    post "User registration" do
      tags "Registrations"
      consumes "application/json"
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string },
              password_confirmation: { type: :string }
            }
          }
        },
        required: %w[email password password_confirmation]
      }

      response "201", "User registered successfully" do
        schema type: :object,
               properties: {
                 message: { type: :string },
                 user: {
                   type: :object,
                   properties: {
                     id: { type: :integer },
                     email: { type: :string }
                   }
                 }
               },
               required: %w[message user]

        let(:user) { { user: { email: "test@example.com", password: "password", password_confirmation: "password" } } }
        run_test!
      end

      response "422", "Invalid registration data" do
        let(:user) { { user: { email: "bad.email", password: "short", password_confirmation: "mismatch" } } }
        run_test!
      end
    end
  end
end
