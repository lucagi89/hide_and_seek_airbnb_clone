# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# create flats in the database
User.destroy_all
Flat.destroy_all
Booking.destroy_all

puts "Creating users..."

user1 = User.create!(
    email: "qewqwe@asdasda.com",
    password: "123456",
    name: "John Doe",
    photo: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    )
user2 = User.create!(
    email: "qswqwq@deded.com",
    password: "123456",
    name: "Jane Doe",
    photo: "https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cGVyc29ufGVufDB8fDB8fHww"
    )
user3 =User.create!(
    email: "popo@owowow.com",
    password: "123456",
    name: "John Smith",
    photo: "https://images.unsplash.com/photo-1491349174775-aaafddd81942?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHBlcnNvbnxlbnwwfHwwfHx8MA%3D%3D"
    )
user4 = User.create!(
    email: "qpqpp@oqoqo.com",
    password: "123456",
    name: "Jane Smith",
    photo: "https://images.unsplash.com/photo-1499952127939-9bbf5af6c51c?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHBlcnNvbnxlbnwwfHwwfHx8MA%3D%3D"
    )

puts "Finished creating users!"

puts "Creating flats..."

flat1 = Flat.create!(
    name: 'Light & Spacious Garden Flat London',
    location: '10 Clifton Gardens London W9 1DT',
    description: 'A lovely summer feel for this spacious garden flat. Two double bedrooms, open plan living area, large kitchen and a beautiful conservatory.',
    price_per_night: 75,
    number_of_guests: 3,
    user_id: user1.id,
    photo: "https://plus.unsplash.com/premium_photo-1684175656320-5c3f701c082c?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  )
flat2 = Flat.create!(
    name: 'Stylish House Close to River Thames',
    location: '4 Baker Street London W1U 6LW',
    description: 'Stylish and comfortable house for families and friends to enjoy. Close to the River Thames and the famous Baker Street.',
    price_per_night: 150,
    number_of_guests: 5,
    user_id: user2.id,
    photo: ""
  )
flat3 = Flat.create!(
    name: 'Stunning 2 Bed Flat in Notting Hill',
    location: '10 Pembridge Gardens London W2 4DU',
    description: 'A beautiful, spacious and stylish 2 bed flat in the heart of Notting Hill.',
    price_per_night: 100,
    number_of_guests: 4,
    user_id: user3.id,
    photo: "https://unsplash.com/photos/a-bedroom-with-a-view-of-the-city-LBP2iFqIwcc"
  )
flat4 = Flat.create!(
    name: 'Modern 1 Bed Flat in Shoreditch',
    location: '10 Redchurch Street London E2 7DD',
    description: 'A modern, stylish and comfortable 1 bed flat in the heart of Shoreditch.',
    price_per_night: 90,
    number_of_guests: 2,
    user_id: user4.id,
    photo: "https://plus.unsplash.com/premium_photo-1684175656320-5c3f701c082c?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8ZmxhdHxlbnwwfHwwfHx8MA%3D%3D"
  )
puts 'Finished creating flats!'


puts "Creating bookings..."

Booking.create!(
    start_date: "2021-10-01",
    end_date: "2021-10-10",
    user_id: user1.id,
    flat_id: flat1.id
    )
Booking.create!(
    start_date: "2021-10-01",
    end_date: "2021-10-10",
    user_id: user2.id,
    flat_id: flat2.id
    )
Booking.create!(
    start_date: "2021-10-01",
    end_date: "2021-10-10",
    user_id: user3.id,
    flat_id: flat3.id
    )
Booking.create!(
    start_date: "2021-10-01",
    end_date: "2021-10-10",
    user_id: user4.id,
    flat_id: flat4.id
    )

puts "Finished creating bookings!"
