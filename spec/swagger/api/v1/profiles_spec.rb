require 'swagger_helper'
require "devise/jwt/test_helpers"

describe "Profiles", type: :request do
  let(:user) { create(:user) }
  let(:credentials) { { user: { email: user.email, password: user.password } } }

  before do
    sign_in_user(user, credentials)
  end

  path '/api/v1/profile' do
    get 'Retrieves the current user profile' do
      tags 'Profiles'
      produces 'application/json'
      consumes 'application/json'
      security [ bearerAuth: [] ]

      response(200, 'profiles#show') do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 email: { type: :string },
                 phone: { type: :string },
                 store_name: { type: :string },
                 store_uid: { type: :string }
               },
               required: %w[id email phone store_name store_uid]

        before do |example|
          submit_request(example.metadata)
        end

        it 'returns the current user profile' do |example|
          data = JSON.parse(response.body)

          expect(response).to have_http_status(:ok)
          expect(data['email']).to eq(user.email)
          expect(data['phone']).to eq(user.phone)
          expect(data['store_name']).to eq(user.store_name)
          expect(data['store_uid']).to eq(user.store_uid)
        end
      end
    end
  end
end
