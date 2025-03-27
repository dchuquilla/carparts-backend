class AddPartChassisToRequest < ActiveRecord::Migration[8.0]
  def change
    add_column :requests, :part_chassis, :string
  end
end
