class CreateProposals < ActiveRecord::Migration[8.0]
  def change
    create_table :proposals do |t|
      t.decimal :price
      t.string :currency, default: 'USD'
      t.integer :delivery_time_days
      t.integer :warranty_months
      t.text :notes
      t.string :status
      t.references :request, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
