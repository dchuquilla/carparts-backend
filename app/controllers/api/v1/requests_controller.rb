class Api::V1::RequestsController < ApplicationController
  before_action :set_request, only: %i[ show update destroy ]

  # GET /api/v1/requests
  def index
    @requests = Request.all

    render json: @requests
  end

  # GET /api/v1/requests/1
  def show
    render json: @request
  end

  # POST /api/v1/requests
  def create
    @request = Request.new(request_params)

    if @request.save
      render json: @request, status: :created
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/requests/1
  def update
    if @request.update(request_params)
      render json: @request
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/requests/1
  def destroy
    @request.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def request_params
      # params.fetch(:request, {:user_phone, :user_email, :user_name, :part_name, :part_brand, :part_model, :part_year})
      params.require(:request).permit(:user_phone, :user_email, :user_name, :part_name, :part_brand, :part_model, :part_year)
    end
end
