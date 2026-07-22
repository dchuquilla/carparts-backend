module Chatbot
  class ChatResponseService
    def initialize(session)
      @session = session
      @locale = detect_locale_from_session
    end

    def generate_response(parsed_message)
      state = parsed_message[:state]

      case state
      when "GREETING"
        generate_greeting_response
      when "PARSE_REQUEST"
        generate_parse_request_response(parsed_message)
      when "COLLECT_DATA"
        generate_collect_data_response(parsed_message)
      when "COMMENT"
        generate_comment_response
      when "UNPLEASANT"
        generate_unpleasant_response
      when "NO_REPLACEMENT"
        generate_no_replacement_response
      else
        generate_error_response
      end
    end

    private

    def detect_locale_from_session
      if @session.user&.language.present?
        @session.user.language
      else
        "es"
      end
    end

    def generate_greeting_response
      I18n.with_locale(@locale) do
        I18n.t("chatbot.greeting")
      end
    end

    def generate_parse_request_response(parsed_message)
      I18n.with_locale(@locale) do
        if @session.complete?
          I18n.t("chatbot.confirm_request",
            part_name: parsed_message.dig(:request, :part_name),
            part_brand: parsed_message.dig(:request, :part_brand),
            part_model: parsed_message.dig(:request, :part_model),
            part_year: parsed_message.dig(:request, :part_year)
          )
        else
          pending = @session.pending_fields.join(", ")
          I18n.t("chatbot.collect_data", pending_fields: pending)
        end
      end
    end

    def generate_collect_data_response(parsed_message)
      I18n.with_locale(@locale) do
        pending = @session.pending_fields.join(", ")
        I18n.t("chatbot.collect_data", pending_fields: pending)
      end
    end

    def generate_comment_response
      I18n.with_locale(@locale) do
        I18n.t("chatbot.error")
      end
    end

    def generate_unpleasant_response
      I18n.with_locale(@locale) do
        I18n.t("chatbot.unpleasant")
      end
    end

    def generate_no_replacement_response
      I18n.with_locale(@locale) do
        I18n.t("chatbot.no_replacement")
      end
    end

    def generate_error_response
      I18n.with_locale(@locale) do
        I18n.t("chatbot.error")
      end
    end
  end
end
