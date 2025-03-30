FactoryBot.define do
  factory :jwt_denylist do
    jti { "MyString" }
    exp { "2025-03-30 01:48:16" }
  end
end
