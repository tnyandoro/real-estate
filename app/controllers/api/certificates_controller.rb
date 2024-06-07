class Api::CertificatesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_certificate, only: [:show, :destroy]

  # GET /api/certificates
  def index
    @certificates = Certificate.all
    render json: @certificates
  end

  # GET /api/certificates/1
  def show
    render json: @certificate
  end

  # POST /api/certificates
  def create
    @certificate = Certificate.new(certificate_params)
    if @certificate.save
      render json: @certificate, status: :created
    else
      render json: @certificate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/certificates/1
  def destroy
    @certificate.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_certificate
    @certificate = Certificate.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def certificate_params
    params.require(:certificate).permit(:student_id, :course_id, :certificate_number, :pdf_certificate, :png_certificate)
  end
end
