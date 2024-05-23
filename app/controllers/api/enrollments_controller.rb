class Api::EnrollmentsController < ApplicationController
    # before_action :authenticate_user!
    before_action :set_enrollment, only: [:show, :update, :destroy]
  
    # GET /api/enrollments
    def index
      @enrollments = Enrollment.all
      render json: @enrollments
    end
  
    # GET /api/enrollments/1
    def show
      render json: @enrollment
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
  
    # PATCH/PUT /api/enrollments/1
    def update
      if @enrollment.update(enrollment_params)
        render json: @enrollment
      else
        render json: @enrollment.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/enrollments/1
    def destroy
      @enrollment.destroy
      head :no_content
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end
  
    # Only allow a trusted parameter "white list" through.
    def enrollment_params
      params.require(:enrollment).permit(:student_id, :course_id)
    end
end  
