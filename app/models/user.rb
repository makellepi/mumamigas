class User < ApplicationRecord

notification_target

has_many :messages, class_name: 'Message', :foreign_key => "recipient_id"
has_many :sent_messages, class_name: 'Message', :foreign_key => "sender_id"


mount_uploader :photo, PhotoUploader


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_many :activities, dependent: :destroy
# has_many :user_interests, dependent: :destroy
# has_many :interests, dependent: :destroy

# accepts_nested_attributes_for :user_interests
# accepts_nested_attributes_for :interests


acts_as_follower
acts_as_followable

  include PgSearch
  multisearchable :against => [ :interest_category, :city],
    using: {
      tsearch: { prefix: true }
    }

end
