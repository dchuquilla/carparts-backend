class AddTermsAndConditionsToUser < ActiveRecord::Migration[8.0]
  def up
    add_column :users, :terms_and_conditions, :boolean
  end

  def down
    remove_column :users, :terms_and_conditions
  end
end
