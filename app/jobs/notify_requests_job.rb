class NotifyRequestsJob < ApplicationJob
  queue_as :requests_notifications

  def perform(*args)
    # Notify users about their requests
    Chatbot::WebhookService.new({ url: "/requests" }).notify_requests_list_store
  end
end
