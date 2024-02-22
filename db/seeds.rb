# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

# create flats in the database
Booking.destroy_all
Flat.destroy_all
User.destroy_all

puts "Creating users..."

20.times do
    User.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Internet.password(min_length: 8)
    )
end

puts "Finished creating users!"

puts "Creating flats..."

40.times do
  Flat.create!(
    name: Faker::Address.community,
    city: Faker::Address.city,
    address: Faker::Address.street_address,
    description: Faker::Lorem.paragraph,
    price_per_night: rand(50..200),
    number_of_guests: rand(1..10),
    photo_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['apartment']),
    user_id: User.all.sample.id
  )
end

puts 'Finished creating flats!'

puts "Creating bookings..."

20.times do
  Booking.create!(
    start_date: Faker::Date.between(from: '2024-01-01', to: '2024-12-31'),
    end_date: Faker::Date.between(from: '2021-10-01', to: '2021-12-31'),
    user_id: User.all.sample.id,
    flat_id: Flat.all.sample.id
  )
end

puts "Finished creating bookings!"
