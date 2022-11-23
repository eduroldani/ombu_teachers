# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


puts "Running Seeds"

User.destroy_all

user = User.new(email: "email@email.com", password: "secret", first_name: "Test User", last_name: "last Name", is_teacher: true)


user.save!

puts user.id

project = Project.create(title: "Scrath", description: "Bla Bla", skills: "New things", user_id: user.id)

puts "Finishing Seeds"
