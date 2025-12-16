class ResetSubscriptionTierEnum < ActiveRecord::Migration[8.0]
  def up
    # Rename the old enum type
    execute <<-SQL
      ALTER TYPE subscription_tier RENAME TO subscription_tier_old;
    SQL

    # Create the new enum type with the correct values
    execute <<-SQL
      CREATE TYPE subscription_tier AS ENUM ('free', 'paid', 'wait', 'cancel', 'test');
    SQL

    # Alter the column to use the new enum type
    execute <<-SQL
      ALTER TABLE users
      ALTER COLUMN subscription_tier TYPE subscription_tier
      USING subscription_tier::text::subscription_tier;
    SQL

    # Drop the old enum type
    execute <<-SQL
      DROP TYPE subscription_tier_old;
    SQL
  end

  def down
    # You can implement the reverse if needed, or leave it as irreversible
    raise ActiveRecord::IrreversibleMigration
  end
end
