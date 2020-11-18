class Yacht < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, presence: true, uniqueness: true
  # validates :build, presence: true
  # validates :coordinates, presence: true
  # validates :description, length: { minimum: 20 }
  # validates :year, numericality: { only_integer: true }
  # validates :weekly_price, numericality: { only_integer: true }
  # validates :length, numericality: { only_integer: true }
  # validates :beam, numericality: { only_integer: true }
  # validates :cruising_speed, numericality: { only_integer: true }
  # validates :number_of_crew, numericality: { only_integer: true }
  # validates :number_of_guests, numericality: { only_integer: true }
  # validates :number_of_cabins, numericality: { only_integer: true }
end
