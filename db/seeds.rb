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

if User.all.size < 10
  puts "Creating 5 users..."
  10.times do
    user = User.new(
      email: Faker::Internet.email,
      first_name: Faker::Name.first_name,
      password: "123456",
      age: (18..50).to_a.sample,
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

unless User.find_by(first_name: "Guerric")
  puts "Creating Guerric"
  guerric = User.new(
    email: "guerric@gmail.com",
    first_name: "Guerric",
    password: "123456789",
    age: 29,
    presentation: "J'adore la musique, le patinage artistique, de surcroit je me passionne pour la philatélie !",
    admin: true
  )
  file = URI.open("https://scontent-cdg4-3.cdninstagram.com/v/t51.2885-19/299359173_8139885692718815_5517122244597947946_n.jpg?stp=dst-jpg_s320x320&_nc_ht=scontent-cdg4-3.cdninstagram.com&_nc_cat=111&_nc_ohc=UChXjBBN8ZwAX9-tZWE&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfDZLu72Xunh23lsuOXztHUuHajWes7WeD-qr6Z9CdI_QA&oe=6505E412&_nc_sid=8b3546")
  guerric.avatar.attach(io: file, filename: "avatar#{guerric.id}.png", content_type: "image/png")
  guerric.save
  puts "Guerric is alive!"
end

# loop for activities
if Activity.all.length < 15
  puts "Creating activities..."
  (15 - Activity.all.length).times do
    activity = Activity.new(
      date: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now + 90),
      duration: rand(1..6),
      city: CITIES.sample,
      cancelled: false,
      activity_type: Activity::TYPE.sample
    )
    type = DESCRIPTION[activity.activity_type]
    activity.title = type.keys.sample
    activity.content = DESCRIPTION[activity.activity_type][activity.title]
    activity.participants_max = rand(2..12) if activity.title.size > 8
    activity.address = ADDRESSES[activity.city].sample
    activity.user = User.all.sample
    file_picture = URI.open("https://source.unsplash.com/random/?#{activity.activity_type}")
    activity.photo.attach(io: file_picture, filename: "photo#{activity.id}.png", content_type: "image/png")
    activity.save!
  end
  puts "Activities created!"
  puts "Creating associated chatrooms..."
  Activity.all.each do |activity|
    Chatroom.create(name: "#{activity.title} ##{activity.id}", activity: activity)
  end
  puts "Chatrooms created!"
end

if Registration.all.size < 20
  puts "Creating registrations..."
  Registration.destroy_all
  User.all.each do |user|
    activities_without_user = Activity.all.reject { |act| act.user == user }
    reg1 = Registration.new(user: user)
    reg1.activity = activities_without_user.sample
    reg1.save!
    reg2 = Registration.new(user: user)
    reg2.activity = activities_without_user.reject { |act| act == reg1.activity }.sample
    reg2.save!
  end
  puts "All finished!"
end
