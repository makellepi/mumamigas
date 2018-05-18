class Interest < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :user_interests, dependent: :destroy
  has_many :users, through: :user_interests

   include PgSearch
  pg_search_scope :search_by_category,
    against: [ :category ],
    using: {
      tsearch: { prefix: true }
    }

end
