class Api::V1::RequestsController < ApplicationController
  include UniqueKeyGenerator

  before_action :set_request, only: %i[ show update destroy ]

  # GET /api/v1/requests
  def index
    @q = Request.ransack(params[:q])
    @requests = @q.result

    render json: @requests
  end

  # GET /api/v1/requests/1
  def show
    render json: @request
  end

  # POST /api/v1/requests
  def create
    uniq_key = get_uniq_key(request_params.values.join("-"))
    existing_requests = Request.by_today_uniq_key(uniq_key)

    if existing_requests.any?
      Chatbot::WebhookService.new(existing_requests.first, api_v1_request_url(existing_requests.first, only_path: true)).notify_request_duplicated
      render json: { error: I18n.t("requests.new.duplicated") }, status: :unprocessable_entity and return
    end

    @request = Request.new(request_params)

    if @request.save
      Chatbot::WebhookService.new(@request, api_v1_request_url(@request, only_path: true)).notify_request_success
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
      # params.require(:request).permit(:user_phone, :user_email, :user_name, :part_name, :part_brand, :part_model, :part_year)
      params.expect(request: [ :user_phone, :user_email, :user_name, :part_name, :part_brand, :part_model, :part_year, :part_image ])
    end
end
