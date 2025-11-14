class RemoveNotNullInStoreUidToUser < ActiveRecord::Migration[8.0]
  def change
    change_column_null :users, :store_uid, true
  end
end
