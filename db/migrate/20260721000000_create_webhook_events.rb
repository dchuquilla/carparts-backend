class CreateWebhookEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :webhook_events do |t|
      t.string :event_type, null: false
      t.string :source_phone
      t.json :payload, default: {}

      t.timestamps
    end

    add_index :webhook_events, :event_type
    add_index :webhook_events, :source_phone
    add_index :webhook_events, :created_at
  end
end
