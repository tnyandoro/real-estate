# app/models/teacher.rb
class Teacher < ApplicationRecord
    validates :first_name, :last_name, :phone_number, :address, presence: true
  
    has_many :courses, dependent: :destroy
  
    def name
      "#{first_name} #{last_name}"
    end
  end
