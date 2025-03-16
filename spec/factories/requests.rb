FactoryBot.define do
  factory :request do
    user_phone { "593111111111" }
    user_name { nil }
    user_email { nil }
    part_name { "PART NAME" }
    part_brand { "PART BRAND" }
    part_model { "PART MODEL" }
    part_year { 2025 }
  end
end
