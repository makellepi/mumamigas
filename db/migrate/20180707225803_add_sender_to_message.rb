class AddSenderToMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :sender, :string
  end
end
