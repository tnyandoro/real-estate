class Api::CoursesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_course, only: [:show, :update, :destroy]
  
    # GET /api/courses
    def index
      @courses = Course.all
      render json: @courses
    end
  
    # GET /api/courses/1
    def show
      render json: @course
    end
  
    # POST /api/courses
    def create
      @course = Course.new(course_params)
      if @course.save
        render json: @course, status: :created
      else
        render json: @course.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/courses/1
    def update
      if @course.update(course_params)
        render json: @course
      else
        render json: @course.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/courses/1
    def destroy
      @course.destroy
      head :no_content
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end
  
    # Only allow a trusted parameter "white list" through.
    def course_params
      params.require(:course).permit(:name, :description)
    end
end
  
