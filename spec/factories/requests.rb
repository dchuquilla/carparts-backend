require 'faker'

FactoryBot.define do
  factory :request do
    user_phone { "+593111111111" }
    user_name { nil }
    user_email { nil }
    part_name { "PART NAME" }
    part_brand { Faker::Vehicle.manufacture }
    part_model { Faker::Vehicle.model }
    part_year { Faker::Number.between(from: 2000, to: 2025) }
  end
end
