class RenameDisableFromConversations < ActiveRecord::Migration[5.1]
  def change
    rename_column :conversations, :disabled, :read
  end
end
