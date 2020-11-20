class Yacht < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, dependent: :destroy
  has_many_attached :photos

  validates :title, presence: true, uniqueness: true
  validates :build, presence: true
  validates :address, presence: true
  validates :description, length: { minimum: 20 }
  validates :year, numericality: { only_integer: true }
  validates :weekly_price, numericality: { only_integer: true }
  validates :length, numericality: { only_integer: true }
  validates :beam, numericality: { only_integer: true }
  validates :cruising_speed, numericality: { only_integer: true }
  validates :number_of_crew, numericality: { only_integer: true }
  validates :number_of_guests, numericality: { only_integer: true }
  validates :number_of_cabins, numericality: { only_integer: true }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def self.fetch_toys_for_yacht
    toys = %w(Jetski Scuba BananaBoat Snorkels Harpoon Helicopter)
    result = []
    toys.each { |toy| result << [toy, toy]}
    result
  end
  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
    against: [ :title, :description, :address ],
    using: {
      tsearch: { prefix: true }
    }
end
