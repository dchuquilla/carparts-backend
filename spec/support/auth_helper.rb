module AuthHelper
  def sign_in_user(user, credentials = nil)
    credentials ||= { user: { email: user.email, password: user.password } }
    user.confirm

    post '/users/sign_in', params: credentials.to_json, headers: { "Content-Type" => "application/json" }
  end

  def sign_out_user
    delete '/users/sign_out', headers: { "Content-Type" => "application/json" }
  end
end

RSpec.configure do |config|
  config.include AuthHelper, type: :request
end
