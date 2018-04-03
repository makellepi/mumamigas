class RemoveMessageFromMatch < ActiveRecord::Migration[5.1]
  def change
    remove_reference :matches, :message, foreign_key: true
  end
end
