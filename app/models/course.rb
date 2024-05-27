# == Schema Information
#
# Table name: courses
#
#  id         :bigint           not null, primary key
#  name       :string
#  teacher_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

## Course model represents a course offered by a teacher.
## It has a name, belongs to a teacher, and has many enrollments and students through enrollments.
class Course < ApplicationRecord
    attribute :name, :string

    belongs_to :teacher
    has_many :enrollments, dependent: :destroy
    has_many :students, through: :enrollments
end
