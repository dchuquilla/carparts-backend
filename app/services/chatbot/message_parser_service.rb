module Chatbot
  class MessageParserService
    def initialize(message_text)
      @message_text = message_text
    end

    def parse
      return error_response if @message_text.blank?

      response = LLM::DeepseekService.parse_message(@message_text)
      validate_response(response)
    rescue StandardError => e
      Rails.logger.error("MessageParserService error: #{e.message}")
      error_response
    end

    private

    def validate_response(response)
      return response if response.is_a?(Hash) && response[:state].present?

      error_response
    end

    def error_response
      { state: "ERROR_CREATE_REQUEST" }
    end
  end
end
