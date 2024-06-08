# app/models/student.rb
class Student < ApplicationRecord
    has_many :enrollments, dependent: :destroy
    has_many :courses, through: :enrollments
  
    validates :first_name, :last_name, :phone_number, :address, :date_of_birth, :region, :email, presence: true
end
