class Request < ApplicationRecord
  validates :user_phone, :part_name, :part_brand, :part_model, :part_year, presence: true
  validates :part_year, numericality: { only_integer: true, greater_than: 1900, less_than: 2100 }
end
