module Api
  module V1
    class WebhooksController < ApplicationController
      skip_before_action :authenticate_user!, raise: false
      before_action :verify_webhook_signature, only: [:handle_openwa]

      def handle_openwa
        case event_type
        when "message"
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
        # OpenWa webhooks may not include Authorization header
        # For now, accept all webhook events. In production, consider:
        # - Verifying webhook signature from OpenWa payload
        # - Using IP whitelisting
        # - Requiring API key in request body

        Rails.logger.info("Webhook received from OpenWa")
      end

      def handle_message
        phone = webhook_params.dig(:data, :from)
        text = webhook_params.dig(:data, :body)

        Rails.logger.info("Received message from #{phone}: #{text}")

        # Log webhook event
        WebhookEvent.create(
          event_type: "message",
          source_phone: phone,
          payload: webhook_params.to_h
        )

        # Process message and send response asynchronously
        Chatbot::WebhookMessageHandlerService.new(phone, text).handle
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
