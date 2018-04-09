class AddChildrenToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :children, :integer
  end
end
