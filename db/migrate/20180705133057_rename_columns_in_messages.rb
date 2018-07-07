class RenameColumnsInMessages < ActiveRecord::Migration[5.1]
  def change
    rename_column :messages, :sender, :sender_id
    rename_column :messages, :recipient, :recipient_id
  end
end
