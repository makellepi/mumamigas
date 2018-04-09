class AddWorkStatusToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :work_status, :boolean
  end
end
