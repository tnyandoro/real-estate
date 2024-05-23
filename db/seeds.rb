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

   # Clear existing courses
   Course.destroy_all

   # Create dummy courses
   course_titles = [
    "Real Estate Fundamentals",
    "Property Management",
    "Real Estate Law",
    "Real Estate Finance",
    "Real Estate Appraisal",
    "Real Estate Investment",
    "Real Estate Marketing",
    "Real Estate Ethics",
    "Real Estate Development",
    "Real Estate Brokerage"
  ]
  
  course_titles.each do |title|
    Course.create!(
      title: title,
      description: Faker::Lorem.sentence
    )
  end
  
  puts "Created #{Course.count} courses"
  
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

  Certificate.destroy_all

  # Retrieve existing student IDs
  student_ids = Student.pluck(:id)

  # Create dummy certificates
  10.times do
    Certificate.create!(
      student_id: student_ids.sample,
      course_id: Course.pluck(:id).sample, # Assuming you have courses seeded as well
      certificate_number: Faker::Number.unique.number(digits: 8),
      pdf_certificate: Faker::Internet.url,
      png_certificate: Faker::Internet.url
    )
  end

  puts "Created #{Certificate.count} certificates"

end


