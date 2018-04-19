class User < ApplicationRecord
mount_uploader :photo, PhotoUploader

has_many :messages
has_many :matches
has_many :interests, dependent: :destroy
has_many :activities, dependent: :destroy
has_many :locations, dependent: :destroy


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
