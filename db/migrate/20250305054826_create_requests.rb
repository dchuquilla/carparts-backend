class CreateRequests < ActiveRecord::Migration[8.0]
  def change
    create_table :requests do |t|
      t.string :user_phone, null: false
      t.string :user_name, null: true
      t.string :user_email, null: true
      t.string :part_name, null: false
      t.string :part_brand, null: false
      t.string :part_model, null: false
      t.integer :part_year, null: false

      t.timestamps
    end
  end
end
