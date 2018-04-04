class User < ApplicationRecord

mount_uploader :photo, PhotoUploader


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
