class Location < ApplicationRecord
  belongs_to :user
  has_many :activities, dependent: :destroy
  has_many :matches, dependent: :destroy

  include PgSearch
  pg_search_scope :search_by_city,
    against: [ :city ],
    using: {
      tsearch: { prefix: true }
    }
end
