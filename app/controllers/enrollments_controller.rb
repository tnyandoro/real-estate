# app/controllers/api/enrollments_controller.rb
class Api::EnrollmentsController < ApplicationController
    # GET /api/enrollments
    def index
      @enrollments = Enrollment.all
      render json: @enrollments
    end
  
    # GET /api/enrollments/1
    def show
      @enrollment = Enrollment.find(params[:id])
      render json: @enrollment
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Enrollment not found' }, status: :not_found
    end
  
    # POST /api/enrollments
    def create
      @enrollment = Enrollment.new(enrollment_params)
      if @enrollment.save
        render json: @enrollment, status: :created
      else
        render json: @enrollment.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/enrollments/1
    def destroy
      @enrollment = Enrollment.find(params[:id])
      @enrollment.destroy
      head :no_content
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Enrollment not found' }, status: :not_found
    end
  
    private
  
    def enrollment_params
      params.require(:enrollment).permit(:student_id, :course_id)
    end
end
