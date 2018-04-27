class AddFriendStatusToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :friend_status, :string
  end
end
