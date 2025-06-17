require 'faker'

FactoryBot.define do
  factory :proposal do
    price { Faker::Commerce.price(range: 0..1000.0, as_string: true) }
    currency { "USD" }
    delivery_time_days { Faker::Number.between(from: 1, to: 30) }
    warranty_months { Faker::Number.between(from: 1, to: 24) }
    notes { Faker::Lorem.sentence }
    status { "pending" }
    request { create(:request) }
    user { create(:user) }
  end
end
