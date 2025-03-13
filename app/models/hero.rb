class Hero < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :power, presence: true
  validates :description, presence: true

  include PgSearch::Model
pg_search_scope :search_by_name_and_power,
  against: [:name, :power],
  using: {
    tsearch: { prefix: true }
  }

end
