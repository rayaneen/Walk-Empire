# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Cleaning DB"
ControlPoint.destroy_all
User.destroy_all
Activity.destroy_all

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
ControlPoint.create!(name: "Le Wagon", status:"Capturé", difficulty:"#{rand(1..1000)}m",
                     latitude: 44.85993992280524, longitude: -0.5658384933716525, user_id: rand(User.first.id..User.last.id))
puts "Done!"
puts "Creating Jardin Public Control Point"

ControlPoint.create!(name: "Jardin Public", status:"Capturé", difficulty:"#{rand(1..1000)}m",
                     latitude: 44.848207, longitude: -0.578130, user_id: rand(User.first.id..User.last.id))
puts "Done!"
puts "Creating Jardin Public Control Point"

ControlPoint.create!(name: "iBoat", status:"Capturé", difficulty:"#{rand(1..1000)}m",
                     latitude: 44.8659342, longitude: -0.5591377, user_id: rand(User.first.id..User.last.id))
puts "Done!"

puts "Creating CAPC musée d'art contemporain de Bordeaux"
ControlPoint.create!(name: "CAPC musée d'art contemporain de Bordeaux", status:"Capturé", difficulty:"#{rand(1..1000)}m",
                     latitude: 44.848627741310736, longitude: -0.5720502867787579, user_id: rand(User.first.id..User.last.id))
puts "Done!"
