class AddSubscriptionTierToUser < ActiveRecord::Migration[8.0]
  def up
    create_enum :subscription_tier, ['free', 'paid']
    add_column :users, :subscription_tier, :subscription_tier
  end

  def down
    remove_column :users, :subscription_tier
    drop_enum :subscription_tier
  end
end
