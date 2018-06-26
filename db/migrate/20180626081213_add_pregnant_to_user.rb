class AddPregnantToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :pregnant, :boleean
    add_column :users, :pregnantmonths, :integer
  end
end
