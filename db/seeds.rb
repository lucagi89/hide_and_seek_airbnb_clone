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

admin = User.create!(
  name: "Admin",
  email: "admin@admin.com",
  password: "123456"
)

User.create!(
  name: "Vincent",
  email: "vincent@vincent.com",
  password: "vincent"
)


puts "Finished creating users!"

puts "Creating flats..."

Flat.new(
  name: "AirShip with Breathtaking Highland Views",
  city: "Drimnin, United Kingdom",
  address: "1 bedroom - 1 bed - 1 bathroom",
  description: "Retreat to the deck of this sustainable getaway and gaze at the twinkling constellations under a cosy tartan blanket. AirShip 2 is an iconic, insulated aluminum pod designed by Roderick James with views of the Sound of Mull from dragonfly windows. Airship002 is comfortable, quirky and cool. It does not pretend to be a five star hotel. The reviews tell the story. If booked for the dates you want check out our new listing The Pilot House, Drimnin which is on the same 4 acra site.

    The kitchen has a toaster, electric kettle, tefal halogen hob, combination oven/microwave. All pots and pans, plates, glasses ,cutlery provided. All you will need to bring is your food. worth stocking up on your way in as Lochaline is the nearest place to shop which is 8 miles away.

    The AirShip is situated in a beautiful, secluded position on a four-acre site. Stunning views reach across the Sound of Mull towards Tobermory on the Isle of Mull and out to sea toward Ardnamurchan Point.
    The space
    The kitchen has a toaster, electric kettle, tefal halogen hob, combination oven/microwave. All pots and pans, plates, glasses ,cutlery provided. All you will need to bring is your food. worth stocking up on your way in as Lochaline is the nearest place to shop which is 8 miles away.",
  price_per_night: 170,
  number_of_guests: 2,
  photo_url: "https://a0.muscache.com/im/pictures/f672c9b4-cc80-46bc-890b-a085efaee2d7.jpg?im_w=720",
  user_id: admin.id
).save

Flat.new(
  name: "Moinho das Feteiras | The Mill",
  city: "Ponta Delgada, Portugal",
  address: "1 bedroom - 1 bed - 1 bathroom",
  description: "Built in the 19th century, with a 360 degrees view over the sea and surroundings on the top floor.
    It features a Bedroom with a king size bed, a very well-decorated living room with kitchenette, and a WC.
    Free WiFi, air conditioning, Led TV and DVD player.
    Private parking inside the premises, providing extra security.
    Perfect for an unforgettable honeymoon experience.
    The space
    It has a 4000 m garden with sub-tropical fruit trees, garden trees, and flowers.
    In addition to the Mill ideal for 2 people, it has two more accommodation units: the Mó de Cima's House ideal up to 3 people and the Moleiro's House that hold up tp 4 people.
    Guest access
    Guests have access to all property spaces.
    Registration number
    Exempt",
  price_per_night: 180,
  number_of_guests: 2,
  photo_url: "https://a0.muscache.com/im/pictures/miso/Hosting-5264493/original/10d2c21f-84c2-46c5-b20b-b51d1c2c971a.jpeg?im_w=720",
  user_id: admin.id
).save

Flat.new(
  name: "Bumble Barn at Great Field Farm",
  city: "Canterbury, United Kingdom",
  address: "3 bedrooms - 5 beds - 2 bathrooms",
  description: "Great Field Farm is set in 45 acres, including gardens, paddocks and the great field with different crops each year.
    Bumble Barn is the newest addition to our eco-friendly holiday lodges. Built to Passiv house standards with smart technology and a beautiful living sedum roof that bees love.
    The views from the sitting room and patio over open fields and sky are stunning, with wildlife all around.
    Truly quiet and rural, yet Canterbury, Folkestone, Hythe, Channel Tunnel only 10 minutes drive.
    The space
    Bumble Barn has a large sitting, dining and kitchen area, opening onto the patio with views of the horse paddocks, open field and trees.
    Sitting Room has a smart 4K TV
    Fully equipped kitchen with large fridge/freezer
    Main bedroom with king sized double bed and en suite shower room. Optional colour changing LED lighting.
    2 twin bedrooms. Main bathroom with bath/shower",
  price_per_night: 310,
  number_of_guests: 6,
  photo_url: "https://a0.muscache.com/im/pictures/2ce2f829-7965-479a-af98-c5a84824ce06.jpg?im_w=720",
  user_id: admin.id
).save

Flat.new(
  name: "The Floating Terrarium",
  city: "Greater London, United Kingdom",
  address: "2 guests - 1 bedroom - 1 bed - 1 bathroom",
  description: "Come stay on the Floating Terrarium one of the Airbnb’s OMG winning designs.

    This place is the perfect juxtaposition of luxury & nature. An eco-conscious experience that will have you immersed in a 48.3sqm space with over 150 plants, situated on the canal in East London’s coolest area, Hackney.

    15 minute walk to local transport whilst also have tonnes of local shops bars a stones throw away.

    Personalised location guides available on request!",
  price_per_night: 190,
  number_of_guests: 2,
  photo_url: "https://a0.muscache.com/im/pictures/dacc7843-4386-49ec-8535-38bd35709ad8.jpg?im_w=720",
  user_id: admin.id
).save

Flat.new(
  name: "RentitSpain: Casa Acantilado",
  city: "Salobreña, Spain",
  address: "3 bedrooms - 4 beds - 3 bathrooms",
  description: "Rent the Entire Cliff House for Yourself, as seen on Netflix's 'The World's Most Extraordinary Homes', located on the Granada Coast. Perched in the mountains with a perfect 20°C climate. Its unique design, exclusive furniture, and captivating views will enchant you. Enjoy a spacious 150 m² living room with open kitchen, overlooking the Mediterranean. Just 5 km to the beach for sea adventures, and near Sierra Nevada for skiing in winter.
    The space
    The Cliff House is not just a dwelling, but a true architectural masterpiece where every detail, from design to functionality, has been meticulously orchestrated to provide an unparalleled experience. The roof, an engineering spectacle, employs a system of artisanally deformed metal mesh formwork, covered with hand-made zinc scales, all supported by rafters.

    Inside, the furniture is not just pieces, but unique digital designs created by the architects, with the goal of merging comfort and aesthetics exclusively for guests. The entire house is conditioned for total climate comfort, equipped with air conditioning and heat pump systems that guarantee optimal comfort in any season.",
  price_per_night: 536,
  number_of_guests: 6,
  photo_url: "https://a0.muscache.com/im/pictures/1bd12dfa-f681-4979-b805-b0c7b6b5511c.jpg?im_w=720",
  user_id: admin.id
).save

Flat.new(
  name: "Secret Suite",
  city: "Amsterdam, Netherlands",
  address: "1 bedroom - 2 beds - 2.5 bathrooms",
  description: Faker::Lorem.paragraph,
  price_per_night: 845,
  number_of_guests: 2,
  photo_url: "https://a0.muscache.com/im/pictures/miso/Hosting-20952140/original/9552783a-f452-4963-b5d0-22a362d37c53.jpeg?im_w=720",
  user_id: admin.id
).save

Flat.new(
  name: "Sweet night under the stars",
  city: "Caylus, France",
  address: "1 bedroom - 1 bed - 1 bathroom",
  description: "The enveloping all-wood structure of the zôme, open on the top to the stars thanks to its 6 branch rose window, welcomes you for a visit of pure relaxation and diconnection. In order to preserve the environmental impact, the zôme has been designed in order to reduce its carbon footprint as much as possible. It is therefore managed in an eco-responsable way, the supply of water by a battery-powered pump system, electricity by a solar panel and dry toilets. This cocooning space awaits you and offers you relaxation with its readings, word games or board games. You can also have the opportunity to meditate (2 stools and mats await you) A peacefull outdoor space is reserved for you where you can relax on deckchairs and an hammock for 2 peoples. Or keep busy playing Molki, darts, rackets, pétanque... And if you want to visit the multi-faceted region, a notebook is at your disposal with a range of activities to practice : hiking from the zôme, tourist visits from Caylus (medieval town)... If you do not want to go out for dinner, you have on site and at any time you want a catering service by providing 100% organic and seasonal dishes (individual canned glass - low temperature cooking) and reheatable on the spot that you can consume inside or outside. If natural light is not enough to recharge the solar panel, don't worry auxiliary lightings are available for you in order to maintain constant lighting during your evening.",
  price_per_night: 118,
  number_of_guests: 2,
  photo_url: "https://a0.muscache.com/im/pictures/b7756897-ef31-4080-b881-c4c7b9ec0df7.jpg?im_w=720",
  user_id: admin.id
).save

Flat.new(
  name: "Woolbrook Reservoir",
  city: "Devon, United Kingdom",
  address: "6 bedrooms - 10 beds - 4 bathrooms",
  description: "Woolbrook Reservoir in Sidmouth is a luxury, uniquely designed celebration home with a sprawling top-tier private garden (with hot tub, bar and countryside views). Sky-high glass frames a light-flooded central courtyard around which lie 6 bedrooms, 4 bathrooms, a huge high spec kitchen / diner, sitting room and games room. The inside space extends out to a covered area with more seating, table tennis and pool table via bifold doors, making it perfect for gatherings no matter the weather.
  The space
  The long entrance hall has a bench seat with several doors leading off (one of which to the right is where the utility with washing machine and tumble dryer are kept, and one to the left which leads to the gym / weight training room). The hall then has a door at the far end which opens into the breath-taking triple volume foyer with a seating area and two modern leather aviator chairs
  ",
  price_per_night: 842,
  number_of_guests: 16,
  photo_url: "https://a0.muscache.com/im/pictures/prohost-api/Hosting-699095541647431947/original/2c2221c3-d014-4b4f-a850-29ee47620304.jpeg?im_w=720",
  user_id: admin.id
).save

Flat.new(
  name: "Lov'Nid Passion cabin",
  city: "Joncherey, France",
  address: "1 bedroom - 1 bed - 1 bathroom",
  description: "Discover the Lov 'Nid Passion cabin, a cocoon of love perched at 6 meters height. Enjoy the charming setting of this romantic accommodation in the heart of the nature.
  The space
  You will access it with a spiral staircase that will take you to the first part of the treehouse, consisting of a living room to enjoy cocooning moments. A hanging hammock awaits on the terrace with stunning views of the surrounding nature. Let yourself be lulled by birds chirping and the gentle sound of foliage. Now it's time to experience your cozy nest. To do this, cross the suspension bridge which will take you straight to your room for a timeless romantic night out.",
  price_per_night: 197,
  number_of_guests: 2,
  photo_url: "https://a0.muscache.com/im/pictures/miso/Hosting-610511843622686196/original/253bfa1e-8c53-4dc0-a3af-0a75728c0708.jpeg?im_w=720",
  user_id: admin.id
).save

Flat.new(
  name: "Cabin Drommen - Treehouse",
  city: "Guyonvelle, France",
  address: "1 bedroom - 1 bed - 0 bathrooms",
  description: "Discover the magical world of the Drommen cabin, unique in France.
  With 4 levels:
  the living room, then the toilet, then the bedroom.
  Finally, you can dine on the perched terrace.",
  price_per_night: 84,
  number_of_guests: 2,
  photo_url: "https://a0.muscache.com/im/pictures/miso/Hosting-24598097/original/91290830-0db6-40c0-a23b-86a904ee5239.jpeg?im_w=720",
  user_id: admin.id
).save

Flat.new(
  name: "Wild Spa Cabin ",
  city: "Joncherey, France",
  address: "1 bedroom - 1 bed - 0 bathrooms",
  description: "At the end of the pond, you'll stumble across this magnificent floating hut and enter the wild scenery of the place to fully experience the Coucoo Grands Reflets huts.

  After a boat ride to access your nest, dive into your hot tub for a pure moment of relaxation on the calm waters of the pond. The 360° terrace of the Spa Sauvage hut will allow you to fully enjoy the panorama !
  Other things to note
  This cabin is equipped with dry toilets and a 10L water reserve. Our individual and all equipped bathrooms are located in the ecohut at the reception building level and are accessible 24 hours a day",
  price_per_night: 265,
  number_of_guests: 2,
  photo_url: "https://a0.muscache.com/im/pictures/9e10ac8b-903d-4e54-9a23-74935f14b4a6.jpg?im_w=720",
  user_id: admin.id
).save


puts 'Finished creating flats!'
