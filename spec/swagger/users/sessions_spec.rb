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

        let(:user) { create(:user) }
        let(:credentials) { { user: { email: user.email, password: user.password } } }

        before do
          sign_in_user(user, credentials)
        end

        it "returns user data", :aggregate_failures do
          body = JSON.parse(response.body)
          expect(body["message"]).to include(I18n.t("devise.sessions.signed_in"))
          expect(response.headers["authorization"]).to be_present
          expect(response.status).to eq(200)
          expect(body["user"]["email"]).to eq(user.email)
          expect(body["user"]["id"]).to eq(user.id)
          expect(body["user"]["phone"]).to eq(user.phone)
          expect(body["user"]["store_name"]).to eq(user.store_name)
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
          user.confirm
          authorization
          # submit_request(example.metadata.merge(headers: authorization))
          delete "/users/sign_out", headers: { "Authorization" => authorization["Authorization"] }
        end

        it "returns a valid 200 response" do |_example|
          body = JSON.parse(response.body)
          expect(response.status).to eq(200)
          expect(body["message"]).to include(I18n.t("devise.sessions.signed_out"))
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
              password_confirmation: { type: :string },
              phone: { type: :string },
              store_name: { type: :string },
              store_uid: { type: :string }
            },
            required: %w[email password password_confirmation phone store_name store_uid]
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

        let(:user) { {
          user: {
            email: "test@example.com",
            password: "password",
            password_confirmation: "password",
            phone: "1234567890",
            store_name: "Test Store",
            store_uid: "test_store_uid"
          }
        }}
        run_test!
      end

      response "422", "Invalid registration data" do
        let(:user) { {
          user: {
            email: "bad.email",
            password: "short",
            password_confirmation: "mismatch",
            phone: "1234567890",
            store_name: "Test Store",
            store_uid: "test_store_uid"
          }
        }}
        run_test!
      end
    end
  end
end
