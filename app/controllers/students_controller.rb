# app/controllers/api/students_controller.rb
class Api::StudentsController < ApplicationController
  before_action :set_student, only: [:show, :update, :destroy, :enroll]

  # GET /api/students
  def index
    @students = Student.all
    render json: @students, include: :courses
  end

  # GET /api/students/1
  def show
    render json: @student, include: :courses
  end

  # POST /api/students
  def create
    @student = Student.new(student_params)
    if @student.save
      render json: @student, status: :created, include: :courses
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/students/1
  def update
    if @student.update(student_params)
      render json: @student, include: :courses
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/students/1
  def destroy
    @student.destroy
    head :no_content
  end

  # POST /api/students/1/enroll
  def enroll
    course = Course.find(params[:course_id])
    @student.courses << course
    render json: @student, include: :courses
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Course not found' }, status: :not_found
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :phone_number, :address, :date_of_birth, :region, :email)
  end
end
