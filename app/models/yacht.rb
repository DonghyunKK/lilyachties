class Yacht < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, presence: true, uniqueness: true
  # validates :build, presence: true
  # validates :coordinates, presence: true
  # validates :description, length: { minimum: 20 }
  # validates :year, numericality: { only_integer: true }
  # validates :weekly_price, numericality: { only_integer: true }
end
