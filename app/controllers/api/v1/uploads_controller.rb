module Api
  module V1
    class UploadsController < ApplicationController
      require 'aws-sdk-s3'

      # POST /uploads
      def create
        image = params[:image]
        return render json: { error: 'No image provided' }, status: :bad_request unless image

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

        render json: { url: obj_id }, status: :created
      rescue => e
        render json: { error: e.message }, status: :unprocessable_entity
      end

      def show
        # show image from cloudflare r2 using custom domain
        custom_domain = Rails.application.credentials.dig(:r2_custom_domain)
        obj_id = "#{Rails.application.credentials.dig(:r2_environment)}/photos/#{params[:id]}.webp"
        url = "#{custom_domain}/#{obj_id}"

        # Assuming no need to check existence since custom domain is used
        render json: { url: url }, status: :ok
      rescue => e
        render json: { error: e.message }, status: :unprocessable_entity
      end
    end
  end
end