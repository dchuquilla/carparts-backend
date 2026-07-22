class CreateChatSessions < ActiveRecord::Migration[8.0]
  def change
    create_table :chat_sessions do |t|
      t.references :user, foreign_key: true, null: true
      t.references :request, foreign_key: true, null: true
      t.string :user_phone, null: false
      t.string :state, null: false, default: "NEW"
      t.json :request_data, default: {}
      t.datetime :last_message_at

      t.timestamps
    end

    add_index :chat_sessions, :user_phone, unique: true
    add_index :chat_sessions, :state
    add_index :chat_sessions, :last_message_at
  end
end
