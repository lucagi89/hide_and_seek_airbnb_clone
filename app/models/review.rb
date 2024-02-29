class Review < ApplicationRecord
  validates :title, presence: true
  validates :rating, presence: true, inclusion: { in: (0..5) }

  
  belongs_to :booking
  has_one :user, through: :booking
end


