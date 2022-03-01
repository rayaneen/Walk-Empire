# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning DB"
ControlPoint.destroy_all
puts "Creating Le Wagon Control Point"
ControlPoint.create!(name: "Le Wagon", status:"Capturé", difficulty:"100m",
                     latitude: 44.85993992280524, longitude: -0.5658384933716525, user_id: 1)
puts "Done!"
puts "Creating Jardin Public Control Point"

ControlPoint.create!(name: "Jardin Public", status:"Capturé", difficulty:"100m",
                     latitude: 44.85993992280524, longitude: -0.5658384933716525, user_id: 1)
puts "Done!"
puts "Creating Jardin Public Control Point"

ControlPoint.create!(name: "iBoat", status:"Capturé", difficulty:"100m",
                     latitude: 44.8659342, longitude: -0.5591377, user_id: 1)
puts "Done!"

puts "PS: All Control points belong to user_id: 1"
