class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :location
  validates :date, presence: true
  validates :time, presence: true
end
