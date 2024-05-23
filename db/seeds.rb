require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Clear existing users
Student.destroy_all

# Create dummy users
10.times do
    Student.create!(
        email: Faker::Internet.unique.email,
        password: 'password123',
        password_confirmation: 'password123'
    )
end

puts "Created #{Student.count} students"
