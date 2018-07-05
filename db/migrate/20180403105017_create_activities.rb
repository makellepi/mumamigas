class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.references :user, foreign_key: true
      t.string :description
      t.date :date
      t.time :time
      t.timestamps
    end
  end
end
