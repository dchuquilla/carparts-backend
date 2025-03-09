class AddDigestKeyToRequest < ActiveRecord::Migration[8.0]
  def change
    add_column :requests, :digest_key, :string, null: true
  end
end
