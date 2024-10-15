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

n = Rails.env.production? ? 100 : 10 
puts "Creating #{n} users"
1.upto n do |n|
  User.create!(email: "user#{n}@test.com", password: "asdasdasd", password_confirmation: "asdasdasd")
end


puts "Deleting books"
Book.delete_all

puts "Deleting all genres"
Genre.delete_all

puts "Creating genres"
g = Genre.create!(name: "Comedy")
Genre.create!(name: "Light comedy", parent: g)
Genre.create!(name: "Funny histories", parent: g)
Genre.create!(name: "Dark humor", parent: g)

g = Genre.create!(name: "Thriller")
Genre.create!(name: "Scaries stories", parent: g)
Genre.create!(name: "Criminal", parent: g)
Genre.create!(name: "Mystic", parent: g)

g = Genre.create!(name: "Historic")
Genre.create!(name: "Cenozoic", parent: g)
Genre.create!(name: "Paleozoic", parent: g)
Genre.create!(name: "Mesozoic", parent: g)
Genre.create!(name: "Modern history", parent: g)

puts "Deleting authors"
Author.delete_all

10.times do |t|
  Author.create!(name: Faker::Name.name)
end

genres = Genre.where.not(parent: nil).to_a
authors = Author.all.to_a

100.times do |t|
  Book.create!(genre: genres.sample, author: authors.sample, name: Faker::Book.title, pages: rand(20..400), released_at: Date.today-rand(10000), status: ["hot", "classics", "ordinary"].sample, featured: [true, false].sample)
end

puts "Seeds done"
