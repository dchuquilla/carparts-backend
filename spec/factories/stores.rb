require 'faker'

FactoryBot.define do
  factory :store do
    name { Faker::Company.name }
    description { Faker::Lorem.paragraph }
    contact_email { Faker::Internet.email }
    contact_phone { "+593911111111" }
    address { Faker::Address.full_address }
    user { create(:user) }
  end
end
