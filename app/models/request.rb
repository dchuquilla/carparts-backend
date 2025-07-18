class Request < ApplicationRecord
  include UniqueKeyGenerator

  has_many :proposals, dependent: :destroy

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

  def state
    total_fields = 7.0
    filled_fields = usable_fields.count(&:present?)
    (filled_fields / total_fields) * 100
  end

  def pending_data
    usable_fields.each_with_index.with_object([]) do |(field, index), missing_fields|
      column_name = %w[user_phone part_name part_brand part_model part_year part_image part_chassis][index]
      missing_fields << I18n.t("activerecord.attributes.request.#{column_name}") if field.nil?
    end
  end

  def to_json(options = {})
    super({ only: [ :id, :part_name, :part_brand, :part_model, :part_year, :part_image, :part_chassis, :show_key, :created_at ], methods: [ :state, :pending_data ] }.merge(options))
  end

  private

  def add_keys
    self.update_columns(
      show_key: SecureRandom.alphanumeric(10),
      digest_key: get_uniq_key("#{user_phone}-#{part_name}-#{part_brand}-#{part_model}-#{part_year}")
    )
  end

  def usable_fields
    [ user_phone, part_name, part_brand, part_model, part_year, part_image, part_chassis ]
  end
end
