require 'aws-sdk-s3'

module Storable
  extend ActiveSupport::Concern

  included do
    def store_image(image)
      bucket = S3_CLIENT.bucket(Rails.application.credentials.dig(:r2_bucket))
      obj_id = "#{SecureRandom.uuid}_#{image.original_filename}.webp"
      obj = bucket.object("#{Rails.application.credentials.dig(:r2_environment)}/photos/#{obj_id}")

      obj.put(body: image.tempfile, acl: 'public-read')

      obj_id
    end
  end
end