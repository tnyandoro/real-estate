# app/models/student.rb
class Student < ApplicationRecord
    has_many :enrollments
    has_many :courses, through: :enrollments

    validates :first_name, :last_name, :phone_number, :address, :dob, :region, :email, presence: true
end


