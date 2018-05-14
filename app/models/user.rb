class User < ApplicationRecord

mount_uploader :photo, PhotoUploader


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_many :locations, dependent: :destroy
has_many :matches, dependent: :destroy
has_many :messages, dependent: :destroy
has_many :interests, dependent: :destroy
has_many :activities, dependent: :destroy

accepts_nested_attributes_for :interests, :allow_destroy => true

attr_accessor :interests

end
