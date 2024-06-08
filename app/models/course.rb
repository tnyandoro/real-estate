# app/models/course.rb
class Course < ApplicationRecord
    belongs_to :teacher
    has_many :enrollments, dependent: :destroy
    has_many :students, through: :enrollments
end  
