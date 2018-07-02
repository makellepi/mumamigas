class RemoveLocationRefToActivities < ActiveRecord::Migration[5.1]
  def change
    remove_reference :activities, :location, foreign_key: true
  end
end
