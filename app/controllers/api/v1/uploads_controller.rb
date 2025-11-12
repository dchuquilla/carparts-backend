module Api
  module V1
    class UploadsController < ApplicationController
      include Storable

      # POST /uploads
      def create
        image = params[:image]
        return render json: { error: 'No image provided' }, status: :bad_request unless image

        obj_id = store_image(image)

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