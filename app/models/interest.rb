class Interest < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :user_interests, dependent: :destroy
  has_many :users, through: :user_interests

   include PgSearch
  multisearchable :against => [ :category ],
    using: {
      tsearch: { prefix: true }
    }

   def self.rebuild_pg_search_documents
    find_each { |record| record.update_pg_search_document }
   end

end
