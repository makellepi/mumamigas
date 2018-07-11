class Activity < ApplicationRecord
  belongs_to :user
  validates :date, presence: true
  validates :time, presence: true

  mount_uploader :photo, PhotoUploader

end
