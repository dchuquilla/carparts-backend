class ChatSession < ApplicationRecord
  belongs_to :request, optional: true
  belongs_to :user

  enum :state, {
    new: "NEW",
    greeting: "GREETING",
    parse_request: "PARSE_REQUEST",
    collect_data: "COLLECT_DATA",
    comment: "COMMENT",
    unpleasant: "UNPLEASANT",
    no_replacement: "NO_REPLACEMENT"
  }, prefix: true

  validates :user_phone, :state, presence: true
  validates :user_phone, uniqueness: true

  scope :active, -> { where(state: ["NEW", "GREETING", "PARSE_REQUEST", "COLLECT_DATA"]) }
  scope :recent, -> { order(updated_at: :desc) }

  def data
    request_data || {}
  end

  def data=(value)
    self.request_data = value
  end

  def pending_fields
    return [] unless request_data.present?

    required_fields = [:part_name, :part_brand, :part_model, :part_year]
    required_fields.reject { |field| request_data[field].present? }.map(&:to_s)
  end

  def complete?
    request_data.present? &&
      request_data[:part_name].present? &&
      request_data[:part_brand].present? &&
      request_data[:part_model].present? &&
      request_data[:part_year].present?
  end
end
