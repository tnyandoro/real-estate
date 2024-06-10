# app/db/seeds.rb
require 'faker'

# Clear existing records in development and test environments
if Rails.env.development? || Rails.env.test?
  Course.destroy_all
  Student.destroy_all
  Teacher.destroy_all
  Enrollment.destroy_all
  Certificate.destroy_all

  # Create dummy teachers
  teachers = 5.times.map do
    Teacher.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      phone_number: Faker::PhoneNumber.phone_number,
      address: Faker::Address.full_address,
      email: Faker::Internet.unique.email
    )
  end

  puts "Created #{Teacher.count} teachers"

  # Create dummy courses and associate them with teachers
  course_names = [
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

  courses = course_names.each_with_index.map do |course_name, index|
    Course.create!(
      name: course_name,
      description: Faker::Lorem.sentence,
      teacher: teachers[index % teachers.size]  # Assign courses to teachers in a round-robin manner
    )
  end

  puts "Created #{Course.count} courses"

  # Generate unique identification IDs
  used_identifications = Set.new

  generate_unique_identification = -> do
    loop do
      identification = "#{Faker::Number.unique.number(digits: 2)}-#{Faker::Number.unique.number(digits: 6)}-#{Faker::Alphanumeric.alpha(number: 1)}-#{Faker::Number.unique.number(digits: 2)}"
      return identification unless used_identifications.include?(identification)
    end
  end

  # Create dummy students and enroll them in courses
  students = 10.times.map do
    student = Student.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      phone_number: Faker::PhoneNumber.phone_number,
      address: Faker::Address.full_address,
      date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
      region: Faker::Address.state,
      email: Faker::Internet.unique.email,
      identification: generate_unique_identification.call
    )

    # Enroll the student in a random number of courses (between 3 and 10)
    (3..10).to_a.sample.times do
      Enrollment.create!(
        student: student,
        course: courses.sample
      )
    end

    student
  end

  puts "Created #{Student.count} students and enrolled them in courses"

  # Create dummy certificates
  10.times do
    Certificate.create!(
      student: students.sample,
      course: courses.sample,
      certificate_number: Faker::Number.unique.number(digits: 8),
      pdf_certificate: Faker::Internet.url,
      png_certificate: Faker::Internet.url
    )
  end

  puts "Created #{Certificate.count} certificates"
end
