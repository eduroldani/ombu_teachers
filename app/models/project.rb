class Project < ApplicationRecord

  has_many :bookings, dependent: :destroy
  validates :user_id, presence: true

end
