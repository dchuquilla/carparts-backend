require "async"
require "net/http"

module Chatbot
  class WebhookService
    include UniqueKeyGenerator
    attr_reader :request, :proposal, :store, :url, :message

    STORES_URI = URI(Rails.application.credentials.dig(:chatbot_url) + "/webhook/stores/notify")
    REQUESTS_URI = URI(Rails.application.credentials.dig(:chatbot_url) + "/webhook/requests/notify")
    CONTACTS_URI = URI(Rails.application.credentials.dig(:chatbot_url) + "/webhook/contact/notify")

    def initialize(options)
      @request = options[:request]
      @proposal = options[:proposal]
      @store = options[:store]
      @url = options[:url]
      @message = options[:message]
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

    def notify_proposal_accepted
      notify_store("proposals.edit.accepted")
    end

    def notify_contact_to_user
      notify_contact_request(proposal.user.create_contact)
    end

    def notify_contact_to_store
      notify_contact_store(proposal.request.create_contact)
    end

    def notify_request_failed
      notify_request_message("requests.new.error")
    end

    private

    def notify_request(message_key)
      return if Rails.env.test?

      request_url = Rails.application.credentials.dig(:web_url) + url

      Net::HTTP.post_form(
        REQUESTS_URI,
        "userId" => request.user_phone,
        "message" => I18n.t(message_key, request_url: request_url)
      )
    end

    def notify_request_message
      return if Rails.env.test?

      Net::HTTP.post_form(
        REQUESTS_URI,
        "userId" => request.user_phone,
        "message" => I18n.t(message_key, message: message)
      )
    end

    def notify_contact_request(message_key)
      return if Rails.env.test?


      Net::HTTP.post_form(
        CONTACTS_URI,
        "userId" => proposal.request.user_phone,
        "message" => message_key,
        "contact" => "store"
      )
    end

    def notify_request_to_store(message_key)
      return if Rails.env.test?
      request_url = Rails.application.credentials.dig(:web_url) + url

      Async do
        User.find_each(batch_size: 100) do |store|
          Async do
            Net::HTTP.post_form(
              STORES_URI,
              "userId" => store.phone,
              "message" => I18n.t(message_key, request_url: request_url)
            )
          end
        end
      end
    end

    def notify_store(message_key)
      return if Rails.env.test?

      store_url = Rails.application.credentials.dig(:web_url) + url

      Net::HTTP.post_form(
        STORES_URI,
        "userId" => store.phone,
        "message" => I18n.t(message_key, store_url: store_url)
      )
    end

    def notify_contact_store(message_key)
      return if Rails.env.test?

        Net::HTTP.post_form(
        CONTACTS_URI,
        "userId" => proposal.user.phone,
        "message" => message_key,
        "contact" => "car_owner"
      )
    end

    def notify_proposal(message_key)
      return if Rails.env.test?

      request_url = Rails.application.credentials.dig(:web_url) + url

      Net::HTTP.post_form(
        STORES_URI,
        "userId" => proposal.request.user_phone,
        "message" => I18n.t(message_key, proposal_url: request_url)
      )
    end
  end
end
