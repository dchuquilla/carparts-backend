require "net/http"

module Chatbot
  class WebhookService
    include UniqueKeyGenerator
    attr_reader :request, :proposal, :store, :url

    def initialize(options)
      @request = options[:request]
      @proposal = options[:proposal]
      @store = options[:store]
      @url = options[:url]
    end

    def notify_request_success
      notify_request("requests.new.success")
    end

    def notify_request_image
      notify_request("requests.new.ask_image")
    end

    def notify_request_chassis
      notify_request("requests.new.ask_chassis")
    end

    def notify_request_updated
      notify_request("requests.edit.success")
    end

    def notify_request_duplicated
      notify_request("requests.new.duplicated")
    end

    def notify_new_store
      notify_store("stores.new.ask_confirmation")
    end

    def notify_proposal_created
      notify_proposal("proposals.new.success")
    end

    def notify_request_store
      notify_request_to_store("requests.new.stores")
    end

    private

    def notify_request(message_key)
      return if Rails.env.test?

      uri = URI(Rails.application.credentials.dig(:chatbot_url) + "/webhook/requests/notify")
      request_url = Rails.application.credentials.dig(:web_url) + url

      Net::HTTP.post_form(
        uri,
        "userId" => request.user_phone,
        "message" => I18n.t(message_key, request_url: request_url)
      )
    end

    def notify_request_to_store(message_key)
      return if Rails.env.test?
      uri = URI(Rails.application.credentials.dig(:chatbot_url) + "/webhook/stores/notify")
      request_url = Rails.application.credentials.dig(:web_url) + url

      User.find_each(batch_size: 100) do |store|
        Net::HTTP.post_form(
          uri,
          "userId" => store.phone,
          "message" => I18n.t(message_key, request_url: request_url)
        )
      end
    end

    def notify_store(message_key)
      return if Rails.env.test?

      uri = URI(Rails.application.credentials.dig(:chatbot_url) + "/webhook/stores/notify")
      store_url = Rails.application.credentials.dig(:web_url) + url

      Net::HTTP.post_form(
        uri,
        "userId" => store.phone,
        "message" => I18n.t(message_key, store_url: store_url)
      )
    end

    def notify_proposal(message_key)
      return if Rails.env.test?

      uri = URI(Rails.application.credentials.dig(:chatbot_url) + "/webhook/stores/notify")
      request_url = Rails.application.credentials.dig(:web_url) + url

      Net::HTTP.post_form(
        uri,
        "userId" => proposal.request.user_phone,
        "message" => I18n.t(message_key, proposal_url: request_url)
      )
    end
  end
end
