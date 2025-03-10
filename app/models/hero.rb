class Hero < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :power, presence: true
  validates :description, presence: true
end
