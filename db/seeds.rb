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

seth = User.new(
  email: "seth@gmail.com",
  first_name: "Seth",
  password: "123456",
  age: 42,
  presentation: "Rappeur dans l'âme, j'apprécie les petits plaisirs de la vie comme les tartes tatins et les nuages en forme de lapin"
)
file = URI.open("https://emb-sannois.org/wp-content/uploads/2020/10/117769273-10157423863828671-2664532842236795725-n.jpg")
seth.avatar.attach(io: file, filename: "avatar#{seth.id}.png", content_type: "image/png")
seth.save!
puts "Seth is alive!"
puts "Seth is adding a new activity..."
seth_activity = Activity.new(
  date: DateTime.new(2023, 9, 16, 13, 0, 0),
  duration: 2,
  city: "Lille",
  cancelled: false,
  activity_type: "Meditation",
  title: "Initiation à la sophrologie",
  content: "La sophro permet d'acquérir une meilleure connaissance de soi et d'affronter les défis du quotidien avec sérénité. Venez vous initiez avec moi !",
  address: "Citadelle de Lille",
)
seth_activity.user = seth
file_picture = URI.open("https://sophrologue-carolechemoul.com/mydop-images/img156771818264700.jpeg")
seth_activity.photo.attach(io: file_picture, filename: "photo#{seth_activity.id}.png", content_type: "image/png")
seth_activity.save!
puts "Seth added a new activity!"

unless User.find_by(first_name: "Paul")
  puts "Creating Paul..."
  paul = User.new(
    email: "paul@gmail.com",
    first_name: "Paul",
    password: "123456",
    age: 97,
    presentation: "J'aime la cuisine, la nourriture et la cuisine"
  )
  file = URI.open("https://www.mangeonsbien.com/wp-content/uploads/2018/01/Bocuse.jpg")
  paul.avatar.attach(io: file, filename: "avatar#{paul.id}.png", content_type: "image/png")
  paul.save
  puts "Paul is alive!"
  puts "Paul is creating activities..."
  # curling
  paul_activity1 = Activity.new(
    date: DateTime.new(2023, 10, 19, 16, 30, 0),
    duration: 3,
    city: "Lyon",
    cancelled: false,
    activity_type: "Sport",
    title: "Curling",
    content: "Amusons-nous sur la glace avec des balais ! Je ne connais rien à ce sport, mais YOLO !",
    address: "52 rue Baraban",
    user: paul
  )
  picture1 = URI.open("https://i.eurosport.com/2022/02/19/3323187-67944008-2560-1440.jpg")
  paul_activity1.photo.attach(io: picture1, filename: "photo#{paul_activity1.id}.png", content_type: "image/png")
  paul_activity1.save!
  # cours de cuisine
  paul_activity2 = Activity.new(
    date: DateTime.new(2023,10,23,19,45,0),
    duration: 3,
    city: "Lyon",
    cancelled: false,
    activity_type: "Cuisine",
    title: "Cours de cuisine",
    content: "Je propose ce cours de cuisine donné par un pote chef étoilé, et après on mange tous ensemble le diner !",
    address: "55 rue Garibaldi",
    user: paul
  )
  picture2 = URI.open("https://www.chateauberne.com/wp-content/uploads/2021/08/30-ecole-de-cuisine-4-scaled.jpg")
  paul_activity2.photo.attach(io: picture2, filename: "photo#{paul_activity2.id}.png", content_type: "image/png")
  paul_activity2.save!
  # cueillette de trèfles
  paul_activity3 = Activity.new(
    date: DateTime.new(2023,10,22,10,0,0),
    duration: 1,
    city: "Lyon",
    cancelled: false,
    activity_type: "Jardinage",
    title: "Cueillette de trèfles",
    content: "Avec un peu de chance, on trouvera un trèfle à quatre feuilles ?",
    address: "Parc de la tete d'or",
    user: paul
  )
  picture3 = URI.open("https://www.radiofrance.fr/s3/cruiser-production/2021/04/7c040846-24a9-4991-bddc-d3c82522b604/1200x680_gettyimages-812788284.jpg")
  paul_activity3.photo.attach(io: picture3, filename: "photo#{paul_activity3.id}.png", content_type: "image/png")
  paul_activity3.save!
  puts "Paul has 3 activities!"
end

# loop for activities
if Activity.all.length < 15
  puts "Creating future activities..."
  20.times do
    activity = Activity.new(
      date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 90),
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
  puts "Creating meditations activities..."
  2.times do
    activity = Activity.new(
      date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 90),
      duration: rand(1..6),
      city: "Lille",
      cancelled: false,
      activity_type: "Meditation"
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
  1.times do
    activity = Activity.new(
      date: DateTime.new(2023,9,15,19,0,0),
      duration: rand(1..6),
      city: "Lille",
      cancelled: false,
      activity_type: "Meditation"
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
  puts "Creating associated chatrooms..."
  Activity.all.each do |activity|
    Chatroom.create(name: "#{activity.title} ##{activity.id}", activity: activity)
  end
  puts "Chatrooms created!"
  puts "Creating past activities..."
  5.times do
    activity = Activity.new(
      date: Faker::Time.between(from: DateTime.now - 60, to: DateTime.now),
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
end

if Registration.all.size < 20
  puts "Creating registrations..."
  Registration.destroy_all
  User.all.each do |user|
    activities = Activity.all.reject { |act| act.user == user }.sample(2)
    Registration.create(user: user, activity: activities[0])
    Registration.create(user: user, activity: activities[1])
  end
  puts "All finished!"
end

if Favorite.all.size < 30
  puts "Creating favorite activities"
  User.all.each do |user|
    activities_to_add = Activity.all.reject { |act| act.user == user }.sample(3)
    user.favorite(activities_to_add[0])
    user.favorite(activities_to_add[1])
    user.favorite(activities_to_add[2])
  end
  puts "Creating favorite users"
  User.all.each do |user|
    users_to_follow = User.all.reject { |fav_user| fav_user == user }.sample(2)
    user.favorite(users_to_follow[0])
    user.favorite(users_to_follow[1])
  end
  puts "All favorites are ready!"
end

unless User.find_by(first_name: "Sid")
  puts "Creating Sid"
  sid = User.new(
    email: "sid@gmail.com",
    first_name: "Sid",
    password: "123456",
    age: 19,
    presentation: "🌻 Ooooh, un pissenlit ! J'adore les pissenlits ! 🌻 J'aime beaucoup me faire de nouveaux amis, danser et dormir .. surtout dormir !",
  )
  file = URI.open("https://www.serieously.com/app/uploads/2020/07/films-animation-3.jpg")
  sid.avatar.attach(io: file, filename: "avatar#{sid.id}.png", content_type: "image/png")
  sid.save
  puts "Sid is alive!"
end

#  Guerric
unless User.find_by(first_name: "Guerric")
  puts "Creating Guerric"
  guerric = User.new(
    email: "guerric@gmail.com",
    first_name: "Guerric",
    password: "123456789",
    age: 29,
    presentation: "J'ai récemment découvert la cueillette de pissenlit, c'est maintenant ma passion!"
  )
  file = URI.open("https://scontent-cdg4-3.cdninstagram.com/v/t51.2885-19/299359173_8139885692718815_5517122244597947946_n.jpg?stp=dst-jpg_s320x320&_nc_ht=scontent-cdg4-3.cdninstagram.com&_nc_cat=111&_nc_ohc=UChXjBBN8ZwAX9-tZWE&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfDZLu72Xunh23lsuOXztHUuHajWes7WeD-qr6Z9CdI_QA&oe=6505E412&_nc_sid=8b3546")
  guerric.avatar.attach(io: file, filename: "avatar#{guerric.id}.png", content_type: "image/png")
  guerric.save!
  puts "Guerric is alive!"
end

# Alexis
puts "Creating Alexis"
alexis = User.new(
  email: "alexis@gmail.com",
  first_name: "Alexis",
  password: "123456",
  age: 25,
  presentation: "Je suis tombé dans une marmite de cocaïne quand j'étais petit.. cela peut expliquer mon hyperactivité ... Sinon, j'aime les gem.",
)
file = URI.open("https://hellomybusiness.fr/wp-content/uploads/2021/05/1611074903506.jpeg")
alexis.avatar.attach(io: file, filename: "avatar#{alexis.id}.png", content_type: "image/png")
alexis.save!
puts "Alexis is alive!"

# Alexis activity
puts "Creating Alexis activity"
activity_alexis = Activity.new(
  date: DateTime.now - 10,
  duration: 3,
  city: "Lille",
  cancelled: false,
  activity_type: "Equitation"
)
activity_alexis.title = "Allez hop au galop"
activity_alexis.content = "J'ai toujours adoré l'équitation, aujourd'hui je souhaite partager ma passion avec d'autres."
activity_alexis.participants_max = 6
activity_alexis.address = "8 Rue de la Clef"
activity_alexis.user = User.find_by(first_name: "Alexis")
file_picture = URI.open("https://chevaux-passion.com/cdn/shop/products/AffichePosterimprimeHD-Chevauxaugalopsurlesable_1024x1024.jpg?v=1613574752")
activity_alexis.photo.attach(io: file_picture, filename: "photo#{activity_alexis.id}.png", content_type: "image/png")
activity_alexis.save!
# puts "Creating chatroom alexis..."
# Chatroom.create(name: "#{activity_alexis.title} ##{activity_alexis.id}", activity: activity_alexis)
puts "Creating Guerric registration for Alexis Activity..."
Registration.create(user: User.find_by(first_name: "Guerric"), activity: activity_alexis)
Registration.create(user: User.all.sample, activity: activity_alexis)
