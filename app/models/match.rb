class Match < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many :messages, dependent: :destroy

end
