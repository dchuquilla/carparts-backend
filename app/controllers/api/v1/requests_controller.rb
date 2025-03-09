class Api::V1::RequestsController < ApplicationController
  include UniqueKeyGenerator

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
    uniq_key = get_uniq_key(request_params.values.join("-"))
    if Request.by_today_uniq_key(uniq_key).count > 0
      # TODO: Send notification to chatbot
      render json: { error: I18n.t("requests.new.duplicated") }, status: :unprocessable_entity
    end

    @request = Request.new(request_params)

    if @request.save

      require "net/http"
      uri = URI(Rails.application.credentials.dig(:chatbot_url) + "/webhook/requests/notify")
      Net::HTTP.post_form(uri, "userId" => @request.user_phone, "message" => I18n.t("requests.new.success", request_url: Rails.application.credentials.dig(:api_url) + api_v1_request_url(@request, only_path: true)))

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
