class WebhookEvent < ApplicationRecord
  validates :event_type, presence: true

  enum :event_type, {
    message: "message",
    message_status: "message.status",
    connection: "connection"
  }, prefix: true

  scope :recent, -> { order(created_at: :desc) }
end
