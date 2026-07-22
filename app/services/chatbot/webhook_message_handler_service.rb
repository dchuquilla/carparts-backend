module Chatbot
  class WebhookMessageHandlerService
    def initialize(phone_number, message_text)
      @phone_number = phone_number
      @message_text = message_text
      @session_service = ChatSessionService.new(phone_number)
      @parser_service = MessageParserService.new(message_text)
    end

    def handle
      return if skip_message?

      session = @session_service.get_or_create_session
      parsed_message = @parser_service.parse

      session = @session_service.update_session(session, parsed_message)

      response_text = generate_response(session, parsed_message)
      send_response(response_text)

      create_request_if_complete(session)

      session
    rescue StandardError => e
      Rails.logger.error("WebhookMessageHandlerService error: #{e.message}\n#{e.backtrace.join("\n")}")
      send_error_response
    end

    private

    def skip_message?
      @message_text.blank?
    end

    def generate_response(session, parsed_message)
      ChatResponseService.new(session).generate_response(parsed_message)
    end

    def send_response(text)
      OpenwaService.new.send_message(@phone_number, text)
    rescue StandardError => e
      Rails.logger.error("Failed to send response to #{@phone_number}: #{e.message}")
    end

    def send_error_response
      OpenwaService.new.send_message(@phone_number, I18n.t("chatbot.error"))
    rescue StandardError => e
      Rails.logger.error("Failed to send error response to #{@phone_number}: #{e.message}")
    end

    def create_request_if_complete(session)
      if session.complete? && session.state_parse_request?
        @session_service.create_request_from_session(session)
        session.update(state: "COLLECT_DATA")
      end
    end
  end
end
