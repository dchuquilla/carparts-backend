require 'aws-sdk-s3'

module Storable
  extend ActiveSupport::Concern

  included do
    def store_image(image)
      s3_client = Aws::S3::Resource.new(
        access_key_id: Rails.application.credentials.dig(:r2_access_key),
        secret_access_key: Rails.application.credentials.dig(:r2_secret_access_key),
        endpoint: Rails.application.credentials.dig(:r2_endpoint),
        region: 'auto'
      )

      bucket = s3_client.bucket(Rails.application.credentials.dig(:r2_bucket))
      obj_id = "#{SecureRandom.uuid}_#{image.original_filename}.webp"
      obj = bucket.object("#{Rails.application.credentials.dig(:r2_environment)}/photos/#{obj_id}")

      obj.put(body: image.tempfile, acl: 'public-read')

      obj_id
    end
  end
end