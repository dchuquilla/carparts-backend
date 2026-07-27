require "net/http"
require "json"

module Chatbot
  class OpenwaService
    OPENWA_BASE_URL = Rails.application.credentials.dig(:openwa_url) || "http://localhost:2886"
    OPENWA_TOKEN = Rails.application.credentials.dig(:openwa_token)

    def self.send_message(phone, message)
      new.send_message(phone, message)
    end

    def self.send_contact(phone, vcard)
      new.send_contact(phone, vcard)
    end

    def self.get_account_info
      new.get_account_info
    end

    def send_message(session_id_or_phone, phone_or_message = nil, message = nil)
      return if Rails.env.test?

      # Support both old (phone, message) and new (session_id, phone, message) signatures
      if message.nil?
        # Old signature: send_message(phone, message)
        phone = session_id_or_phone
        message_text = phone_or_message
        session_id = get_default_session_id
      else
        # New signature: send_message(session_id, phone, message)
        session_id = session_id_or_phone
        phone = phone_or_message
        message_text = message
      end

      payload = {
        chatId: normalize_phone(phone),
        text: message_text
      }

      post_request("/api/sessions/#{session_id}/messages/send-text", payload)
    end

    def send_contact(phone, vcard)
      return if Rails.env.test?

      payload = {
        to: normalize_phone(phone),
        vcard: vcard
      }

      post_request("/api/contacts/send", payload)
    end

    def get_account_info
      get_request("/api/me")
    end

    private

    def post_request(path, payload)
      uri = URI("#{OPENWA_BASE_URL}#{path}")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == "https"

      request = Net::HTTP::Post.new(uri.path, headers)
      request.body = JSON.generate(payload)

      response = http.request(request)
      handle_response(response, path)
    rescue StandardError => e
      Rails.logger.error("OpenWa request failed: #{e.message}")
      { error: e.message }
    end

    def get_request(path)
      uri = URI("#{OPENWA_BASE_URL}#{path}")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == "https"

      request = Net::HTTP::Get.new(uri.path, headers)
      response = http.request(request)
      handle_response(response, path)
    rescue StandardError => e
      Rails.logger.error("OpenWa request failed: #{e.message}")
      { error: e.message }
    end

    def handle_response(response, path)
      case response.code.to_i
      when 200..299
        JSON.parse(response.body)
      when 401, 403
        Rails.logger.error("OpenWa authentication failed for #{path}")
        { error: "Authentication failed" }
      when 429
        Rails.logger.warn("OpenWa rate limited for #{path}")
        { error: "Rate limited" }
      else
        uri = URI("#{OPENWA_BASE_URL}#{path}")
        Rails.logger.error("OpenWa error #{response.code} for #{uri}: #{response.body}")
        { error: "Request failed with status #{response.code}" }
      end
    rescue JSON::ParserError
      Rails.logger.error("Failed to parse OpenWa response for #{path}")
      { error: "Invalid response format" }
    end

    def headers
      {
        "Authorization" => "Bearer #{OPENWA_TOKEN}",
        "Content-Type" => "application/json",
        "Accept" => "application/json"
      }
    end

    def normalize_phone(phone)
      # Remove any non-digit characters except leading +
      phone.to_s.gsub(/[^\d+]/, "").gsub(/^\+/, "")
    end

    def get_default_session_id
      Rails.application.credentials.dig(:openwa_default_session_id) || ENV['OPENWA_DEFAULT_SESSION_ID'] || raise("No default session ID configured. Set OPENWA_DEFAULT_SESSION_ID or configure openwa_default_session_id in credentials.")
    end
  end
end
