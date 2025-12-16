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
  # validates :store_uid, presence: true, uniqueness: true

  enum :subscription_tier, { free: "free", paid: "paid", wait: "wait", cancel: "cancel" }, prefix: true

  def create_contact
    "BEGIN:VCARD\nVERSION:3.0\nFN;CHARSET=UTF-8:#{store_name}\nN;CHARSET=UTF-8:#{store_name};Tienda;;Almacén;Car\nNICKNAME;CHARSET=UTF-8:Almacén\nUID;CHARSET=UTF-8:#{SecureRandom.uuid}\nEMAIL;CHARSET=UTF-8;type=HOME,INTERNET:#{email}\nTEL;TYPE=CELL;waid=#{phone}:+#{phone}\nREV:2020-03-18T09:07:15.896Z\nEND:VCARD"
  end
end
