class AddInterestCategoryToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :interest_category, :string
  end
end