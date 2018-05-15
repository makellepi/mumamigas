class AddInterestToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :interests, :string, foreign_key: true
  end
end
