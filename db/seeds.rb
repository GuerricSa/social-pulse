# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require "open-uri"

if User.all.size < 5
  puts "Creating 5 users..."
  5.times do
    user = User.new(
      email: Faker::Internet.email,
      first_name: Faker::Name.first_name,
      password: "123456",
      age: (15..50).to_a.sample
    )
    file = URI.open("https://source.unsplash.com/random/?avatar,face")
    user.avatar.attach(io: file, filename: "avatar#{user.id}.png", content_type: "image/png")
    user.save
  end
  puts "Done!"
end
