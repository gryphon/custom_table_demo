# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Deleting all users"
User.delete_all

puts "Creating 100 users"
1.upto 100 do |n|
  User.create!(email: "user#{n}@test.com", password: "asdasdasd", password_confirmation: "asdasdasd")
end

puts "Seeds done"
