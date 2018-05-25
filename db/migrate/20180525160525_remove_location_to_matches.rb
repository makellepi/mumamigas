class RemoveLocationToMatches < ActiveRecord::Migration[5.1]
  def change
    remove_reference :matches, :location, foreign_key: true
  end
end
