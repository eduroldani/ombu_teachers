class Project < ApplicationRecord

  include PgSearch::Model
  pg_search_scope :search_by_title,
    against: [ :title, :skills ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :bookings, dependent: :destroy
  validates :user_id, presence: true


  has_one_attached :photo

end
