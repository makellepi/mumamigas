class RemoveLocationFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_reference :users, :location, foreign_key: true
  end
end
