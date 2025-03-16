class Request < ApplicationRecord
  include UniqueKeyGenerator

  validates :user_phone, :part_name, :part_brand, :part_model, :part_year, presence: true
  validates :part_year, numericality: { only_integer: true, greater_than: 1900, less_than: 2100 }

  after_create :add_keys

  scope :by_today_uniq_key, ->(uniq_key) do
    where(digest_key: uniq_key)
    .where("created_at > ?", DateTime.now.beginning_of_day)
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[user_phone part_name part_brand part_model part_year]
  end

  private

  def add_keys
    self.update_columns(
      show_key: SecureRandom.alphanumeric(10),
      digest_key: get_uniq_key("#{user_phone}-#{part_name}-#{part_brand}-#{part_model}-#{part_year}")
    )
  end
end
