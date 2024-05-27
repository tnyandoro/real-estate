require 'faker'

# Clear existing records in development and test environments
if Rails.env.development? || Rails.env.test?

  # Clear existing courses
  Course.destroy_all

  # Clear existing students
  Student.destroy_all

  # Clear existing teachers
  Teacher.destroy_all

  # Clear existing enrollments
  Enrollment.destroy_all

  # Create dummy teachers
  5.times do
    Teacher.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      phone_number: Faker::PhoneNumber.phone_number,
      address: Faker::Address.full_address
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

  teachers = Teacher.all

  course_names.each do |course_name|
    Course.create!(
      name: course_name,
      description: Faker::Lorem.sentence,
      teacher: teachers.sample
    )
  end

  puts "Created #{Course.count} courses"

  # Create dummy students
  10.times do
    Student.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      phone_number: Faker::PhoneNumber.phone_number,
      address: Faker::Address.full_address,
      dob: Faker::Date.birthday(min_age: 18, max_age: 65),
      region: Faker::Address.state,
      program: Faker::Educator.course_name,
      email: Faker::Internet.unique.email
    )
  end

  puts "Created #{Student.count} students"

  # Retrieve existing student and course IDs
  student_ids = Student.pluck(:id)
  course_ids = Course.pluck(:id)

  # Create dummy enrollments
  20.times do
    Enrollment.create!(
      student_id: student_ids.sample,
      course_id: course_ids.sample
    )
  end

  puts "Created #{Enrollment.count} enrollments"

  # Clear existing certificates
  Certificate.destroy_all

  # Create dummy certificates
  10.times do
    Certificate.create!(
      student_id: student_ids.sample,
      course_id: course_ids.sample,
      certificate_number: Faker::Number.unique.number(digits: 8),
      pdf_certificate: Faker::Internet.url,
      png_certificate: Faker::Internet.url
    )
  end

  puts "Created #{Certificate.count} certificates"
end
