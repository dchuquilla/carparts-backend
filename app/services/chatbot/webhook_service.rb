require "async"

module Chatbot
  class WebhookService
    include UniqueKeyGenerator
    attr_reader :request, :proposal, :store, :url, :message

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

    def notify_requests_list_store
      notify_requests_list_to_store("requests.reminder.stores")
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
      message_text = I18n.t(message_key, request_url: request_url)

      OpenwaService.send_message(request.user_phone, message_text)
    end

    def notify_request_message(message_key)
      return if Rails.env.test?

      message_text = I18n.t(message_key, message: message)
      OpenwaService.send_message(request.user_phone, message_text)
    end

    def notify_contact_request(vcard)
      return if Rails.env.test?

      OpenwaService.send_contact(proposal.request.user_phone, vcard)
    end

    def notify_request_to_store(message_key)
      return if Rails.env.test?
      request_url = Rails.application.credentials.dig(:web_url) + url
      request_description = request.description.truncate(100)

      Async do
        User.paid_subscribers.find_each(batch_size: 100) do |store|
          Async do
            message_text = I18n.t(message_key, request_description: request_description, request_url: request_url)
            OpenwaService.send_message(store.phone, message_text)
          end
        end
      end
    end

    def notify_requests_list_to_store(message_key)
      return if Rails.env.test?
      request_url = Rails.application.credentials.dig(:web_url) + url

      Async do
        User.paid_subscribers.find_each(batch_size: 100) do |store|
          Async do
            message_text = I18n.t(message_key, count: Request.unaccepted.count, request_url: request_url)
            OpenwaService.send_message(store.phone, message_text)
          end
        end
      end
    end

    def notify_store(message_key)
      return if Rails.env.test?

      store_url = Rails.application.credentials.dig(:web_url) + url
      message_text = I18n.t(message_key, store_url: store_url)

      OpenwaService.send_message(store.phone, message_text)
    end

    def notify_contact_store(vcard)
      return if Rails.env.test?

      OpenwaService.send_contact(proposal.user.phone, vcard)
    end

    def notify_proposal(message_key)
      return if Rails.env.test?

      request_url = Rails.application.credentials.dig(:web_url) + url
      message_text = I18n.t(message_key, proposal_url: request_url)

      OpenwaService.send_message(proposal.request.user_phone, message_text)
    end
  end
end
