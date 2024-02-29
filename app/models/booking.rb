class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  has_many :reviews

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :user_id, presence: true
  validates :flat_id, presence: true
end
