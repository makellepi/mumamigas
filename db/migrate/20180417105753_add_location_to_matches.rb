class AddLocationToMatches < ActiveRecord::Migration[5.1]
  def change
    add_reference :matches, :location, foreign_key: true
  end
end
