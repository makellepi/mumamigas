class AddDisabledToConversations < ActiveRecord::Migration[5.1]
  def change
    add_column :conversations, :disabled, :boolean
  end
end
