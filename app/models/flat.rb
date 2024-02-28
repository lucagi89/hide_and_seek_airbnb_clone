class Flat < ApplicationRecord
  validates :name, presence: true
  validates :price_per_night, presence: true
  validates :description, presence: true
  validates :number_of_guests, presence: true
  validates :city, presence: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if:
  :will_save_change_to_address?

  has_many :bookings
  has_many :reviews, through: :bookings
  belongs_to :user

  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :search_by_location_name_and_description,
    against: [ :city, :name, :address, :description],
    using: {
      tsearch: { prefix: true }
  }
end
