class AddShowKeyToRequest < ActiveRecord::Migration[8.0]
  def change
    add_column :requests, :show_key, :string, null: true
  end
end
