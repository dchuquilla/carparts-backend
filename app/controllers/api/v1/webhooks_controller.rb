module Api
  module V1
    class WebhooksController < ApplicationController
      skip_before_action :authenticate_user!, raise: false
      before_action :verify_webhook_signature, only: [:handle_openwa]

      def handle_openwa
        case event_type
        when "message.received"
          handle_message
        when "message.status"
          handle_message_status
        when "connection"
          handle_connection_status
        else
          Rails.logger.info("Unknown OpenWa event type: #{event_type}")
        end

        render json: { success: true }
      rescue StandardError => e
        Rails.logger.error("Webhook error: #{e.message}\n#{e.backtrace.join("\n")}")
        render json: { error: e.message }, status: :bad_request
      end

      private

      def verify_webhook_signature
        # OpenWA sends signature in X-OpenWA-Signature header with format: sha256=<hex>
        signature = request.headers['X-OpenWA-Signature']
        return unless signature_validation_enabled?

        unless valid_signature?(signature)
          Rails.logger.warn("Invalid webhook signature from #{request.remote_ip}")
          render json: { error: 'Invalid signature' }, status: :unauthorized
        end
      end

      def signature_validation_enabled?
        Rails.application.credentials.dig(:openwa_webhook_secret).present?
      end

      def valid_signature?(provided_signature)
        return false if provided_signature.blank?

        expected_signature = calculate_signature
        # Use secure comparison to prevent timing attacks
        ActiveSupport::SecurityUtils.secure_compare(
          provided_signature.to_s,
          expected_signature.to_s
        )
      rescue StandardError => e
        Rails.logger.error("Signature verification error: #{e.message}")
        false
      end

      def calculate_signature
        secret = Rails.application.credentials.dig(:openwa_webhook_secret)
        return nil unless secret

        # OpenWA signs the full JSON request body using HMAC-SHA256
        # Format: sha256=<hex>
        payload = request.body.read
        request.body.rewind  # Reset for later reads
        digest = OpenSSL::HMAC.hexdigest('SHA256', secret, payload)
        "sha256=#{digest}"
      end

      def handle_message
        sessionId = webhook_params.dig(:sessionId)
        phone = webhook_params.dig(:data, :from)
        text = webhook_params.dig(:data, :body)

        Rails.logger.info("Received message from #{sessionId} - #{phone}: #{text}")

        # Log webhook event
        WebhookEvent.create(
          event_type: "message",
          source_phone: phone,
          payload: webhook_params.to_h
        )

        # Process message and send response asynchronously
        Chatbot::WebhookMessageHandlerService.new(sessionId, phone, text).handle
      end

      def handle_message_status
        message_id = webhook_params.dig(:data, :id)
        status = webhook_params.dig(:data, :status)
        to_phone = webhook_params.dig(:data, :to)

        Rails.logger.info("Message #{message_id} to #{to_phone} status: #{status}")

        WebhookEvent.create(
          event_type: "message.status",
          source_phone: to_phone,
          payload: webhook_params.to_h
        )
      end

      def handle_connection_status
        status = webhook_params.dig(:data, :status)
        Rails.logger.info("OpenWa connection status: #{status}")

        WebhookEvent.create(
          event_type: "connection",
          payload: webhook_params.to_h
        )
      end

      def event_type
        webhook_params.dig(:event)
      end

      def webhook_params
        @webhook_params ||= params.except(:controller, :action).permit!.to_h.with_indifferent_access
      end
    end
  end
end
