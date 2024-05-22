
class Api::StudentsController < ApplicationController
    before_action :set_student, only: [:show, :update, :destroy]
  
    # GET /api/students
    def index
      @students = Student.all
      render json: @students
    end
  
    # GET /api/students/1
    def show
      render json: @student
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
      if @student.update(student_params)
        render json: @student
      else
        render json: @student.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/students/1
    def destroy
      @student.destroy
      head :no_content
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end
  
    # Only allow a trusted parameter "white list" through.
    def student_params
      params.require(:student).permit(:first_name, :last_name, :face_image, :identification, :date_of_birth, :region, :program)
    end
end