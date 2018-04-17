class Match < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many :messages, dependent: :destroy

include PgSearch
 pg_search_scope :search_by_location,
    associated_against: {
      location: [ :location ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
