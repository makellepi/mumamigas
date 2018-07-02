class RemoveUserRefToLocations < ActiveRecord::Migration[5.1]
  def change
    remove_reference :locations, :user, foreign_key: true
  end
end
