class Store < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :contact_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :contact_phone, presence: true, format: { with: /\A\+5939\d{8}\z/ }
  validates :address, presence: true
  validates :user, presence: true
  validates :user_id, uniqueness: true
end
