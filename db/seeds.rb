# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# puts "Cleaning database..."
# Restaurant.destroy_all

# puts "Creating restaurants..."
# Restaurant.create!(name: "Dishoom", address: "7 Boundary St, London E2 7JE", category: "Indian")
# puts "Created Dishoom"
# Restaurant.create!(name: "Pizza East", address: "56A Shoreditch High St, London E1 6PQ", category: "Italian")
# puts "Created Pizza East"
# Restaurant.create!(name: "Lupa", address: "Durbanville", category: "Italian")
# puts "Created Lupa"
# Restaurant.create!(name: "Bunny Chow", address: "India", category: "Indian")
# puts "Created Bunny Chow"
# Restaurant.create!(name: "Greco", address: "Greece", category: "Greek")
# puts "Created Greco"

# # 3. Display a message
# puts "Finished! Created #{Restaurant.count} restaurants."

require 'faker'

puts "Cleaning database..."
Review.destroy_all
Restaurant.destroy_all

puts "🍽 Creating restaurants and reviews..."

Restaurant::CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]

10.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: Restaurant::CATEGORIES.sample
  )

  rand(1..3).times do
    Review.create!(
      content: Faker::Restaurant.review,
      rating: rand(0..5),
      restaurant: restaurant
    )
  end
end

puts "Done seeding!"
