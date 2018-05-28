class Interest < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :user_interests, dependent: :destroy
  has_many :users, through: :user_interests


end
