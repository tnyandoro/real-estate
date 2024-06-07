# app/models/course.rb
class Course < ApplicationRecord
    belongs_to :teacher
    has_many :enrollments
    has_many :students, through: :enrollments

    validates :name, :description, :teacher_id, presence: true
end

