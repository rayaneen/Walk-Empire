# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Cleaning DB"
Activity.destroy_all
ControlPoint.destroy_all
User.destroy_all

puts "Creating 20 users"
20.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "secret",
    nickname: Faker::Internet.username(specifier: 5..8),
    xp: rand(1...100)
  )
  user.save!
  puts "#{user.nickname} with #{user.xp} xp points created!"
end

puts "Creating Admin"
User.create!(email: "user1@gmail.com", password:"secret", nickname: "No one", xp: 0)


puts "Creating profile for DARK SASUKE 86!"
User.create!(email: "user3@gmail.com", password:"secret", nickname: "D4RkSaSuKe86", xp: 666)
puts "Finished creating users!"

puts "Creating profile for DEMO!"
User.create!(email: "user2@gmail.com", password:"secret", nickname: "Demo", xp: 0)
puts "Finished creating users!"

puts "Creating Le Wagon Control Point"
ControlPoint.create!(name: "Le Wagon", status:"Capturé", difficulty: 10,
                     latitude: 44.859234165284, longitude: -0.5658168839146295, user: User.find_by_nickname("D4RkSaSuKe86"))
puts "Done!"

puts "Creating Jardin Public Control Point"
ControlPoint.create!(name: "Jardin Public", status:"Capturé", difficulty: 0,
                     latitude: 44.848207, longitude: -0.578130, user: User.all.sample)
puts "Done!"
puts "Creating Jardin Public Control Point"

ControlPoint.create!(name: "iBoat", status:"Capturé", difficulty: rand(1..1000),
                     latitude: 44.8659342, longitude: -0.5591377, user: User.all.sample)
puts "Done!"

puts "Creating CAPC musée d'art contemporain de Bordeaux"
ControlPoint.create!(name: "CAPC", status:"Capturé", difficulty: 0,
                     latitude: 44.848627741310736, longitude: -0.5720502867787579, user: User.all.sample)
puts "Done!"

puts "Creating Eglise St Martial"
ControlPoint.create!(name: "Eglise St Martial", status: "Capturé", difficulty: rand(1..1000),
                     latitude: 44.857989, longitude: -0.564852, user: User.all.sample)
puts "Done!"

puts "Creating Grand-Théâtre"
ControlPoint.create!(name: "Grand-Théâtre", status:"Capturé", difficulty: 0,
                     latitude: 44.84286968425403,  longitude: -0.5742652278749897, user: User.all.sample)
puts "Done!"

puts "Creating Place Gambetta"
ControlPoint.create!(name: "Place Gambetta", status:"Capturé", difficulty: rand(1..10),
                     latitude: 44.841251685226, longitude: -0.5806207513990014, user: User.all.sample)
puts "Done!"

puts "Creating Place Saint Pierre"
ControlPoint.create!(name: "Saint Pierre", status:"Capturé", difficulty: 0,
                     latitude: 44.83988265214394, longitude: -0.5702004972994618, user: User.all.sample)
puts "Done!"

puts "Creating Place Porte Cailhau"
ControlPoint.create!(name: "Porte Cailhau", status:"Capturé", difficulty: rand(1..1000),
                     latitude: 44.83883379977185, longitude: -0.5684846878498125, user: User.all.sample)
puts "Done!"

puts "Creating Place Grosse Cloche"
ControlPoint.create!(name: "Grosse Cloche", status:"Capturé", difficulty: 0,
                     latitude: 44.835640992057314,  longitude: -0.5714149119064934, user: User.all.sample)
puts "Done!"

puts "Creating La Victoire"
ControlPoint.create!(name: "La Victoire", status:"Capturé", difficulty: rand(1..1000),
                     latitude: 44.831253999069254,  longitude:  -0.5727863993101522, user: User.all.sample)
puts "Done!"


puts "Creating Halle des Chartrons"
ControlPoint.create!(name: "Halle des Chartrons", status:"Capturé", difficulty: 0,
                     latitude: 44.852854276346584,  longitude: -0.5722793444069948, user: User.all.sample)
puts "Done!"

puts "Creating Piscine du Grand Parc"
ControlPoint.create!(name: "Piscine du Grand Parc", status:"Capturé", difficulty: rand(1..1000),
                     latitude: 44.857953257960425,  longitude:  -0.579733584769508, user: User.all.sample)
puts "Done!"

puts "Creating France 3 Aquitaine"
ControlPoint.create!(name: "France 3 Aquitaine", status:"Capturé", difficulty: 0,
                     latitude: 44.85164063470125, longitude:  -0.591891860811593, user: User.all.sample)
puts "Done!"

puts "Hotel de Police"
ControlPoint.create!(name: "Hotel de Police", status:"Capturé", difficulty: rand(1..1000),
                     latitude: 44.83511986727398, longitude:  -0.5887770467998483, user: User.all.sample)
puts "Done!"

puts "Piscine Judaique"
ControlPoint.create!(name: "Piscine Judaique", status:"Capturé", difficulty: 0,
                     latitude: 44.840753640010846, longitude:  -0.5909554514924478, user: User.all.sample)
puts "Done!"


puts "Bergonie"
ControlPoint.create!(name: "Bergonie", status:"Capturé", difficulty: rand(1..1000),
                     latitude: 44.82418137530873, longitude:  -0.5818484539464737, user: User.all.sample)
puts "Done!"

puts "Creating unclaimed control points"
15.times do
  ControlPoint.create!(name: "Unclaimed Territory", status:"Unclaimed", difficulty: rand(1..1000),
                      latitude: rand(44.80000000000000..44.90000000000000), longitude:  rand(-0.5900000000000000..-0.5100000000000000), user: User.find_by_nickname("No one"))
end
puts "Done!"



puts "Seed is finito"
