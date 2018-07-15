class AddUserInterestsToActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :user_interests, :string
  end
end
