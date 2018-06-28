class DeleteColumnPregnantFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :pregnantmonths
  end
end
