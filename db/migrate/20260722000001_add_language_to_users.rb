class AddLanguageToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :language, :string, default: "es", null: false
  end
end
