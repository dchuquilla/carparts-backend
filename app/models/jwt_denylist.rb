class JwtDenylist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Denylist

  self.table_name = 'jwt_denylists'

  validates :jti, presence: true
  validates :jti, uniqueness: true

  scope :by_jti, ->(jti) { where(jti: jti) }

  def revoke
    update(created_at: Time.current)
  end

  def revoked?
    created_at.present?
  end

  def self.revoke_jti(jti)
    entry = by_jti(jti)
    entry.revoke if entry
  end

  def self.revoke_all
    all.each(&:revoke)
  end
end
