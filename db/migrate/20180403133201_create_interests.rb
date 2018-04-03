class CreateInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :interests do |t|
      t.references :user, foreign_key: true
      t.text :category

      t.timestamps
    end
  end
end
