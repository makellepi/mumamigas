class Location < ApplicationRecord
  belongs_to :user, optional: true
  has_many :activities, dependent: :destroy
  has_many :matches, dependent: :destroy

  include PgSearch
  pg_search_scope :search_by_city_and_country
    against: [:city, :country],
    using: {
      tsearch: { prefix: true }
    }
  end

end
