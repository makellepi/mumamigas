class Location < ApplicationRecord
  belongs_to :user, optional: true
  has_many :activities, dependent: :destroy
  has_many :matches, dependent: :destroy
end
