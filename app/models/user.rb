class User < ApplicationRecord

mount_uploader :photo, PhotoUploader


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_many :locations, dependent: :destroy
has_many :matches, dependent: :destroy
has_many :messages, dependent: :destroy
has_many :activities, dependent: :destroy
has_many :user_interests, dependent: :destroy
has_many :interests, dependent: :destroy

accepts_nested_attributes_for :user_interests
accepts_nested_attributes_for :interests

acts_as_followable
acts_as_follower

  include PgSearch
  multisearchable :against => [ :interest_category, :city],
    using: {
      tsearch: { prefix: true }
    }

end
