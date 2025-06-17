class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_one :store, dependent: :destroy
  has_many :proposals, dependent: :destroy

  validates :phone, presence: true, uniqueness: true
  validates :store_name, presence: true
  validates :store_uid, presence: true, uniqueness: true
end
