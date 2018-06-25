class Location < ApplicationRecord
  belongs_to :user
  has_many :activities, dependent: :destroy


end
