class AddChildrenAgeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :children_age, :integer
  end
end
