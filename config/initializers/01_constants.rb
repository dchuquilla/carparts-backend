PROPOSAL_STATUSES = {
  pending: "pending",
  accepted: "accepted",
  rejected: "rejected"
}

S3_CLIENT = Aws::S3::Resource.new(
  access_key_id: Rails.application.credentials.dig(:r2_access_key),
  secret_access_key: Rails.application.credentials.dig(:r2_secret_access_key),
  endpoint: Rails.application.credentials.dig(:r2_endpoint),
  region: 'auto'
)