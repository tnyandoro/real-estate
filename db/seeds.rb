require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Clear existing users

if Rails.env.development? || Rails.env.test?
  # Clear existing students
  Student.destroy_all

  # Create dummy students
  10.times do
    Student.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      dob: Faker::Date.birthday(min_age: 18, max_age: 65),
      region: Faker::Address.state,
      program: Faker::Educator.course_name,
      email: Faker::Internet.unique.email
    )
  end

  puts "Created #{Student.count} students"
end


