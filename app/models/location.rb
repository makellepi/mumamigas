class Location < ApplicationRecord
  belongs_to :user
  has_many :activities, dependent: :destroy


  include PgSearch
  multisearchable :against => [ :city ],
    using: {
      tsearch: { prefix: true }
    }

   def self.rebuild_pg_search_documents
    find_each { |record| record.update_pg_search_document }
  end

end
