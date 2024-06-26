# app/models/enrollment.rb
class Enrollment < ApplicationRecord
  belongs_to :student
  belongs_to :course

  validates :student_id, :course_id, presence: true
end

