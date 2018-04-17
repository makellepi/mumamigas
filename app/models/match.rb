class Match < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many :messages, dependent: :destroy

  validates :status, inclusion: {in: %w(pending accepted declined)}

include PgSearch
 pg_search_scope :search_by_location,
    associated_against: {
      location: [ :location ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
