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
      return if Rails.env.test?

      uri = URI(Rails.application.credentials.dig(:chatbot_url) + "/webhook/requests/notify")
      request_url = Rails.application.credentials.dig(:api_url) + url

      Net::HTTP.post_form(
        uri,
        "userId" => request.user_phone,
        "message" => I18n.t("requests.new.success", request_url: request_url)
      )
    end

    def notify_request_duplicated
      return if Rails.env.test?

      uri = URI(Rails.application.credentials.dig(:chatbot_url) + "/webhook/requests/notify")
      request_url = Rails.application.credentials.dig(:api_url) + url

      Net::HTTP.post_form(
        uri,
        "userId" => request.user_phone,
        "message" => I18n.t("requests.new.duplicated", request_url: request_url)
      )
    end
  end
end
