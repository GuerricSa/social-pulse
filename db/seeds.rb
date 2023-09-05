# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require "open-uri"

USER_PRESENTATIONS = [
  "Amoureuse de la nature, cherche des compagnons de randonnée pour explorer les sentiers pittoresques de sa région.",
  "Passionné de cuisine, propose des ateliers de cuisine à domicile pour partager ses talents culinaires avec d'autres gourmets.",
  "Fan de musique, recherche des partenaires de jam pour des sessions musicales improvisées dans son quartier.",
  "Photographe amateur, organise des sorties photo pour capturer les plus beaux moments de la vie locale.",
  "Sportive passionnée, cherche des coéquipiers pour des matchs de football amical le week-end."
].freeze

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


unless User.find_by(first_name: "Truc")
  puts "Creating Truc"
  truc = User.new(
    email: "truc@gmail.com",
    first_name: "Truc",
    password: "123456",
    age: 28,
    presentation: "J'adore le surf, le ciné et boire des verres entre amis!"
  )
  file = URI.open("https://source.unsplash.com/random/?avatar,face")
  truc.avatar.attach(io: file, filename: "avatar#{truc.id}.png", content_type: "image/png")
  truc.save
  puts "Truc is alive!"
end
