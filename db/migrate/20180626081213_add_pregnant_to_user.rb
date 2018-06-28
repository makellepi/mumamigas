class AddPregnantToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :pregnant, :boolean
    add_column :users, :pregnantmonths, :integer
  end
end
