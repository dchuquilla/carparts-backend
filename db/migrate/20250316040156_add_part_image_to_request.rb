class AddPartImageToRequest < ActiveRecord::Migration[8.0]
  def change
    add_column :requests, :part_image, :string, null: true
  end
end
