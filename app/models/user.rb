class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, presence: true
  # validates :name, presence: true
  has_many :flats
  has_many :bookings
  has_many :flats, through: :bookings
  has_many :owned_flats, class_name: 'Flat', foreign_key: 'user_id', dependent: :destroy
  has_one_attached :photo
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
end
