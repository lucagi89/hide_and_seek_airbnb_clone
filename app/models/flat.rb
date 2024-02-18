class Flat < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :price_per_night, presence: true
  validates :description, presence: true
  validates :number_of_guests, presence: true

  belongs_to :booking
  has_many :bookings
  has_many :users, through: :bookings
  has_many :reviews, through: :bookings

  has_many_attached :photos
end
