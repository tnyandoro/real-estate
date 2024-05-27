class Student < ApplicationRecord
    has_many :enrollments, dependent: :destroy
    has_many :courses, through: :enrollments

    validates :first_name, :last_name, :email, presence: true
end

