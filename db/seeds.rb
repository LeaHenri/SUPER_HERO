# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"
require "open-uri"

puts "cleaning DB bookings"
Booking.destroy_all

puts "cleaning DB heros"
Hero.destroy_all

puts "cleaning DB users"
User.destroy_all

puts "create a user"
emilie = User.create!(first_name: "emilie", last_name: "besnard", email: "emilie@email.com", password: "123456")
anna = User.create!(first_name: "anna", last_name: "boulin", email: "anna@email.com", password: "123456")
lea = User.create!(first_name: "lea", last_name: "henry", email: "lea@email.com", password: "123456")
nicolas = User.create!(first_name: "nicolas", last_name: "schuller", email: "nicolas@email.com", password: "123456")

puts "creating heros"
images = ["https://images.pexels.com/photos/4061662/pexels-photo-4061662.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://images.pexels.com/photos/3180273/pexels-photo-3180273.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://images.pexels.com/photos/15668552/pexels-photo-15668552/free-photo-of-portrait-cinematographique-du-modele-masculin-billy-dunston-faisant-le-cosplay-d-aquaman-dans-la-gorge-du-fleuve-columbia-photo-prise-par-le-photographe-de-portland-lance-reis-kickass.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "https://images.pexels.com/photos/15464951/pexels-photo-15464951/free-photo-of-femme-modele-retro-telephone.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"]

15.times do
  file = URI.parse(images.sample).open
  hero = Hero.new(name: Faker::Superhero.name, power: Faker::Superhero.power , description: Faker::Superhero.descriptor, user: User.all.sample)
  hero.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  hero.save
end

puts "Finished!"
puts "Created #{Hero.count} heros"
