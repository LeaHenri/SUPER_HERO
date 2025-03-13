class Hero < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :power, presence: true
  validates :description, presence: true
end
