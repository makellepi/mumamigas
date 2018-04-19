class RemoveForeignKey < ActiveRecord::Migration[5.1]
  def change
    remmove_reference :users, :location, foreign_key: true
  end
end
