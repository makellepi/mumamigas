class DropMessagesTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :messages, :sender_id
    drop_table :messages
  end
end
