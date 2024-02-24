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

properties = [
  "https://a0.muscache.com/im/pictures/miso/Hosting-5264493/original/10d2c21f-84c2-46c5-b20b-b51d1c2c971a.jpeg?im_w=720",
  "https://a0.muscache.com/im/pictures/f672c9b4-cc80-46bc-890b-a085efaee2d7.jpg?im_w=720",
  "https://a0.muscache.com/im/pictures/1db57275-c036-4dbf-b896-32ee22253e48.jpg?im_w=720",
  "https://a0.muscache.com/im/pictures/ba068000-9f61-459c-9ecb-6edc11169604.jpg?im_w=720",
  "https://a0.muscache.com/im/pictures/hosting/Hosting-1019299865555116257/original/90b8ccdd-627d-4081-bea2-cf5dca87ed8f.jpeg?im_w=720",
  "https://a0.muscache.com/im/pictures/miso/Hosting-53427254/original/2f26b277-ca8e-4c7b-bec2-d72f61803234.jpeg?im_w=720",
  "https://a0.muscache.com/im/pictures/miso/Hosting-32081638/original/f181cbd0-07a1-4250-b0c0-83798b962855.jpeg?im_w=720",
  "https://a0.muscache.com/im/pictures/miso/Hosting-651183262441548030/original/8ae0522d-5df4-44df-b6de-08103795ab74.jpeg?im_w=720",
  "https://a0.muscache.com/im/pictures/miso/Hosting-713793474951553871/original/2ac03203-3d06-441c-bc82-77f28ac26c6a.jpeg?im_w=720",
  "https://a0.muscache.com/im/pictures/miso/Hosting-28254684/original/7ae3a2eb-29b5-4443-971c-aaee77899d86.jpeg?im_w=720",
  "https://a0.muscache.com/im/pictures/prohost-api/Hosting-1027800814785286766/original/f5927ea7-8a8c-4d8f-b8ac-f1bbdcf01c6e.jpeg?im_w=720",
  "https://a0.muscache.com/im/pictures/miso/Hosting-676044415326884478/original/e32429f8-56bd-4ba1-a98a-46efc64e3e69.jpeg?im_w=720"
]

12.times do
  photo_url = properties.sample
  properties.delete(photo_url)
  Flat.create!(
    name: Faker::Address.community,
    city: Faker::Address.city,
    address: Faker::Address.street_address,
    description: Faker::Lorem.paragraph,
    price_per_night: rand(50..200),
    number_of_guests: rand(1..10),
    photo_url: photo_url,
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
