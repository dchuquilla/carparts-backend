require "net/http"

module Chatbot
  class WebhookService
    include UniqueKeyGenerator
    attr_reader :request, :url

    def initialize(request, url)
      @request = request
      @url = url
    end

    def notify_request_success
      notify_request("requests.new.success")
    end

    def notify_request_image
      notify_request("requests.new.ask_image")
    end

    def notify_request_duplicated
      notify_request("requests.new.duplicated")
    end

    private

    def notify_request(message_key)
      return if Rails.env.test?

      uri = URI(Rails.application.credentials.dig(:chatbot_url) + "/webhook/requests/notify")
      request_url = Rails.application.credentials.dig(:api_url) + url

      Net::HTTP.post_form(
        uri,
        "userId" => request.user_phone,
        "message" => I18n.t(message_key, request_url: request_url)
      )
    end
  end
end
