class RenameUserOnMessages < ActiveRecord::Migration[5.1]
  def change
    rename_column :messages, :user_id, :sender
  end
end
