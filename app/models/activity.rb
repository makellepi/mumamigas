class Activity < ApplicationRecord
  notification_object

  belongs_to :user
  validates :date, presence: true
  validates :time, presence: true
end
