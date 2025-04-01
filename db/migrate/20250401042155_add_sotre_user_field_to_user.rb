class AddSotreUserFieldToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :phone, :string, null: false
    add_column :users, :store_name, :string, null: false
    add_column :users, :store_uid, :string, null: false
    add_column :users, :store_address, :string
    add_column :users, :renew_at, :date
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string

    add_index :users, :confirmation_token, unique: true
    add_index :users, :phone, unique: true
    add_index :users, :store_uid, unique: true
  end
end
