class Activity < ApplicationRecord
  belongs_to :user
  validates :date, presence: true
  validates :time, presence: true

  mount_uploader :image, PhotoUploader

end
