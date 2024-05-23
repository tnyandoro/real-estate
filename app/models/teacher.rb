# app/models/teacher.rb
class Teacher < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :subject, presence: true
    validates :phone_number, presence: true
    validates :address, presence: true
end