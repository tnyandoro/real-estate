# app/controllers/api/teachers_controller.rb
class Api::TeachersController < ApplicationController
  # GET /api/teachers
  def index
    @teachers = Teacher.all
    render json: @teachers.as_json(methods: :name)
  end

  # GET /api/teachers/1
  def show
    @teacher = Teacher.find(params[:id])
    render json: @teacher.as_json(methods: :name)
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Teacher not found' }, status: :not_found
  end

  # POST /api/teachers
  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      render json: @teacher.as_json(methods: :name), status: :created
    else
      render json: @teacher.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/teachers/1
  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update(teacher_params)
      render json: @teacher.as_json(methods: :name)
    else
      render json: @teacher.errors, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Teacher not found' }, status: :not_found
  end

  # DELETE /api/teachers/1
  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy
    head :no_content
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Teacher not found' }, status: :not_found
  end

  private

  # Only allow a trusted parameter "white list" through.
  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :email, :course, :phone_number, :address)
  end
end
