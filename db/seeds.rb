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


TYPES = ["Sport", "Musique", "Cuisine", "Art", "Lecture", "Voyage", "Jardinage", "Jeux de société", "Randonnée", "Camping", "Théâtre", "Danse", "Photographie", "Bricolage", "Écriture", "Méditation", "Natation", "Cinéma", "Équitation", "Astronomie"]

CITIES = %i[Paris Lyon Lille Rennes Strasbourg].freeze

PARIS = [
  "222 rue de l'université",
  "2 avenue des Champs-Élysées",
  "3 rue du Louvre",
  "3 rue des Haudriettes",
  "5 boulevard Saint-Germain"
].freeze

LYON = [
  "6 place Bellecour",
  "7 rue de la Croix-Rousse",
  "8 quai Victor Augagneur",
  "15 rue de l'Abondance",
  "10 avenue Jean Jaurès"
].freeze

LILLE = [
  "6 rue Nationale",
  "12 avenue du Général de Gaulle",
  "15 rue Jean Moulin"
].freeze

RENNES = [
  "14 place du Théâtre",
  "13 rue de la monnaie",
  "16 boulevard de la Liberté"
].freeze

STRASBOURG = [
  "17 rue du Parlement",
  "18 quai des Bateliers",
  "19 place de la Cathédrale",
  "20 rue des Juifs"
].freeze

# def used in activity.address
def address_activities(city)
  if city
    return PARIS.sample
  elsif city == "Lyon"
    return LYON.sample
  elsif city == "Lille"
    return LILLE.sample
  elsif city == "Rennes"
    return RENNES.sample
  elsif city == "Strasbourg"
    return STRASBOURG.sample
  end
end

# loop for activities
puts "Creating activities"
if Activity.all.length < 10
  (10 - Activity.all.length).times do
    activity = Activity.new(
      title: Faker::Hobby.activity,
      content: Faker::Lorem.sentence(word_count: rand(20..40)),
      date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 90),
      duration: rand(1..6),
      city: CITIES.sample,
      participants_max: rand(2..8),
      cancelled: false,
      activity_type: TYPES.sample
    )
    activity.address = address_activities(activity.city)
    activity.user = User.all.sample
    file_picture = URI.open("https://source.unsplash.com/random/?activity")
    activity.photo.attach(io: file_picture, filename: "photo#{activity.id}.png", content_type: "image/png")
    activity.save!
  end
end
puts "Activities created"
