class AddPartImageToProposal < ActiveRecord::Migration[8.0]
  def change
    add_column :proposals, :part_image, :string
  end
end
