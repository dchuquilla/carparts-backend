require 'faker'

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    # phone_number { Faker::PhoneNumber.phone_number }
    # name { Faker::Name.name }
    # address { Faker::Address.full_address }

    # trait :admin do
    #   role { 'admin' }
    # end

    # trait :user do
    #   role { 'user' }
    # end

    # trait :with_requests do
    #   transient do
    #     requests_count { 5 }
    #   end

    #   after(:create) do |user, evaluator|
    #     create_list(:request, evaluator.requests_count, user: user)
    #   end
    # end
  end
end
