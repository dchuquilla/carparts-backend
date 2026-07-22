module Chatbot
  class ChatSessionService
    def initialize(phone_number)
      @phone_number = phone_number
    end

    def get_or_create_session
      ChatSession.find_or_create_by(user_phone: @phone_number) do |session|
        user = User.find_by(phone: @phone_number)
        session.user = user if user
        session.state = "NEW"
      end
    end

    def get_session
      ChatSession.find_by(user_phone: @phone_number)
    end

    def update_session(session, request_data)
      session.request_data = merge_request_data(session.request_data, request_data)
      session.state = determine_next_state(session, request_data)
      session.last_message_at = Time.current
      session.save
      session
    end

    def create_request_from_session(session)
      return nil unless session.complete?

      data = session.request_data
      Request.create(
        user_phone: session.user_phone,
        part_name: data[:part_name],
        part_brand: data[:part_brand],
        part_model: data[:part_model],
        part_year: data[:part_year],
        part_image: data[:part_image],
        part_chassis: data[:part_chassis]
      )
    end

    private

    def merge_request_data(existing_data, new_data)
      existing_data = existing_data.is_a?(Hash) ? existing_data : {}
      new_request = new_data[:request] || {}

      existing_data.merge(
        part_name: new_request[:part_name] || existing_data[:part_name],
        part_brand: new_request[:part_brand] || existing_data[:part_brand],
        part_model: new_request[:part_model] || existing_data[:part_model],
        part_year: new_request[:part_year] || existing_data[:part_year],
        part_image: new_request[:part_image] || existing_data[:part_image],
        part_chassis: new_request[:part_chassis] || existing_data[:part_chassis]
      )
    end

    def determine_next_state(session, request_data)
      case request_data[:state]
      when "GREETING"
        session.state_new? ? "NEW" : "GREETING"
      when "PARSE_REQUEST"
        "PARSE_REQUEST"
      when "COLLECT_DATA"
        "COLLECT_DATA"
      when "COMMENT"
        "COMMENT"
      when "UNPLEASANT"
        "UNPLEASANT"
      else
        session.state
      end
    end
  end
end
