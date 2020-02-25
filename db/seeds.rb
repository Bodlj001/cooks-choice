# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# renter logins
User.create!(
  email: "x@test.com",
  password: "123456",
  name: "John"
)
User.create!(
  email: "y@test.com",
  password: "123456",
  name: "Jack"
)
User.create!(
  email: "z@test.com",
  password: "123456",
  name: "Jill"
)

# set cook login
User.create!(
  email: "cook@cook.com",
  password: "123456",
  name: "Cookson",
  bio: "I am Cookson! I like to make French haute cusine.",
  cuisine: "French",
  rating: 3,
  price: 25_000,
  iscook: true
)
#cooks
10.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 6),
    name: Faker::Name.name,
    bio: Faker::Company.bs,
    cuisine: %w[French Italian Oriental American].sample,
    rating: rand(1..5),
    price: rand(10_000..50_000),
    iscook: true
  )
end

25.times do
  booking = Booking.create!(
    user: User.where(iscook: false).order(Arel.sql('RANDOM()')).first,
    cook: User.where(iscook: true).order(Arel.sql('RANDOM()')).first,
    location: Faker::Address.street_address
  )
  booking.date = booking.created_at + rand(100_000..900_000)
  booking.save!
end
