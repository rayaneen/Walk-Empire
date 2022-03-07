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
    nickname: Faker::Internet.username,
    xp: rand(0...1000)
  )
  user.save!
  puts "#{user.nickname} with #{user.xp} xp points created!"
end

puts "Creating El Rayano"
User.create!(email: "user1@gmail.com", password:"secret", nickname: "El Rayano", xp: 1000)

puts "Finished creating users!"

puts "Creating Le Wagon Control Point"
ControlPoint.create!(name: "Le Wagon", status:"Capturé", difficulty: rand(1..1000),
                     latitude: 44.85993992280524, longitude: -0.5658384933716525, user_id: rand(User.first.id..User.last.id))
puts "Done!"
puts "Creating Jardin Public Control Point"

ControlPoint.create!(name: "Jardin Public", status:"Capturé", difficulty: rand(1..1000),
                     latitude: 44.848207, longitude: -0.578130, user_id: rand(User.first.id..User.last.id))
puts "Done!"
puts "Creating Jardin Public Control Point"

ControlPoint.create!(name: "iBoat", status:"Capturé", difficulty: rand(1..1000),
                     latitude: 44.8659342, longitude: -0.5591377, user_id: rand(User.first.id..User.last.id))
puts "Done!"

puts "Creating CAPC musée d'art contemporain de Bordeaux"
ControlPoint.create!(name: "CAPC musée d'art contemporain de Bordeaux", status:"Capturé", difficulty: rand(1..1000),
                     latitude: 44.848627741310736, longitude: -0.5720502867787579, user_id: rand(User.first.id..User.last.id))
puts "Done!"


puts "Creating Grand-Théâtre"
ControlPoint.create!(name: "Grand-Théâtre", status:"Capturé", difficulty: rand(1..1000),
                     latitude: 44.84286968425403,  longitude: -0.5742652278749897, user_id: rand(User.first.id..User.last.id))
puts "Done!"

puts "Creating Place Gambetta"
ControlPoint.create!(name: "Place Gambetta", status:"Capturé", difficulty: -1,
                     latitude: 44.841251685226, longitude: -0.5806207513990014, user_id: rand(User.first.id..User.last.id))
puts "Done!"

puts "Creating Place Saint Pierre"
ControlPoint.create!(name: "Saint Pierre", status:"Capturé", difficulty: rand(1..1000),
                     latitude: 44.83988265214394, longitude: -0.5702004972994618, user_id: rand(User.first.id..User.last.id))
puts "Done!"

puts "Creating Place Porte Cailhau"
ControlPoint.create!(name: "Porte Cailhau", status:"Capturé", difficulty: rand(1..1000),
                     latitude: 44.83883379977185, longitude: -0.5684846878498125, user_id: rand(User.first.id..User.last.id))
puts "Done!"

puts "Creating Place Grosse Cloche"
ControlPoint.create!(name: "Grosse Cloche", status:"Capturé", difficulty: rand(1..1000),
                     latitude: 44.835640992057314,  longitude: -0.5714149119064934, user_id: rand(User.first.id..User.last.id))
puts "Done!"

puts "Creating La Victoire"
ControlPoint.create!(name: "La Victoire", status:"Capturé", difficulty: rand(1..1000),
                     latitude: 44.831253999069254,  longitude:  -0.5727863993101522, user_id: rand(User.first.id..User.last.id))
puts "Done!"


puts "Creating Halle des Chartrons"
ControlPoint.create!(name: "Halle des Chartrons", status:"Capturé", difficulty: rand(1..1000),
                     latitude: 44.852854276346584,  longitude: -0.5722793444069948, user_id: rand(User.first.id..User.last.id))
puts "Done!"
