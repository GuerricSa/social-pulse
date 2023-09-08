# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require "open-uri"
require_relative "array_seed"

if User.all.size < 5
  puts "Creating 5 users..."
  5.times do
    user = User.new(
      email: Faker::Internet.email,
      first_name: Faker::Name.first_name,
      password: "123456",
      age: (15..50).to_a.sample,
      presentation: USER_PRESENTATIONS.sample
    )
    file = URI.open("https://source.unsplash.com/random/?avatar,face")
    user.avatar.attach(io: file, filename: "avatar#{user.id}.png", content_type: "image/png")
    user.save
  end
  puts "Done!"
end

unless User.find_by(first_name: "Paul")
  puts "Creating Paul"
  paul = User.new(
    email: "paul@gmail.com",
    first_name: "Paul",
    password: "123456",
    age: 28,
    presentation: "J'adore le surf, le ciné et boire des verres entre amis!"
  )
  file = URI.open("https://images.unsplash.com/photo-1649123245135-4db6ead931b5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1925&q=80")
  paul.avatar.attach(io: file, filename: "avatar#{paul.id}.png", content_type: "image/png")
  paul.save
  puts "Paul is alive!"
end

unless User.find_by(first_name: "Lorie")
  puts "Creating Lorie"
  lorie = User.new(
    email: "lorie@gmail.com",
    first_name: "Lorie",
    password: "123456",
    age: 41,
    presentation: "J'adore la musique, le patinage artistique, de surcroit je me passionne pour la philatélie !"
  )
  file = URI.open("https://www.hiersoiraparis.com/wp-content/uploads/2020/09/Lorie-02.jpeg")
  lorie.avatar.attach(io: file, filename: "avatar#{lorie.id}.png", content_type: "image/png")
  lorie.save
  puts "Lorie is alive!"
end

# loop for activities
if Activity.all.length < 10
  puts "Creating activities"
  (10 - Activity.all.length).times do
    activity = Activity.new(
      date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 90),
      duration: rand(1..6),
      city: CITIES.sample,
      cancelled: false,
      activity_type: Activity::TYPE.sample
    )
    activity.title = DESCRIPTION[activity.activity_type].keys.sample
    activity.content = DESCRIPTION[activity.activity_type][activity.title]
    activity.participants_max = rand(2..12) if activity.title.size > 8
    activity.address = ADDRESSES[activity.city].sample
    activity.user = User.all.sample
    file_picture = URI.open("https://source.unsplash.com/random/?#{activity.activity_type}")
    activity.photo.attach(io: file_picture, filename: "photo#{activity.id}.png", content_type: "image/png")
    activity.save!
  end
  puts "Activities created"
end

if Registration.all.size < 20
  puts "Creating registrations..."
  Registration.destroy_all
  User.all.each do |user|
    reg = Registration.new
    reg.user = user
    reg.activity = Activity.all.sample
    reg.save!
  end
  puts "All finished!"
end
