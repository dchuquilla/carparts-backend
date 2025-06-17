class Proposal < ApplicationRecord
  belongs_to :request
  belongs_to :user

  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :currency, presence: true
  validates :delivery_time_days, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :warranty_months, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
end
