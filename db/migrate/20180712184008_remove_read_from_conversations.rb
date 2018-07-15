class RemoveReadFromConversations < ActiveRecord::Migration[5.1]
  def change
    remove_column :conversations, :read
  end
end
