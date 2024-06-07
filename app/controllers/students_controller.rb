# app/controllers/api/students_controller.rb
class Api::StudentsController < ApplicationController
    # GET /api/students
    def index
      @students = Student.all
      render json: @students
    end
  
    # GET /api/students/1
    def show
      @student = Student.find(params[:id])
      render json: @student
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Student not found' }, status: :not_found
    end
  
    # POST /api/students
    def create
      @student = Student.new(student_params)
      if @student.save
        render json: @student, status: :created
      else
        render json: @student.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/students/1
    def update
      @student = Student.find(params[:id])
      if @student.update(student_params)
        render json: @student
      else
        render json: @student.errors, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Student not found' }, status: :not_found
    end
  
    # DELETE /api/students/1
    def destroy
      @student = Student.find(params[:id])
      @student.destroy
      head :no_content
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Student not found' }, status: :not_found
    end
  
    private
  
    def student_params
      params.require(:student).permit(:first_name, :last_name, :phone_number, :address, :dob, :region, :email)
    end
end
