# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


puts "Running Seeds"

# User.destroy_all
10.times do

  user = User.create(email: Faker::Internet.email, password: "secret", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, is_teacher: true)

end
# user.save!

# puts user.id

# user = User.first

puts "Deleting Projects"

Project.destroy_all

10.times do

  user = User.all[rand(10)]
  Project.create(title: Faker::Hobby.activity, description: Faker::Lorem.paragraph, skills: Faker::Lorem.paragraph, user_id: user.id, address: Faker::Address.country)

end

puts "Finishing Seeds"
