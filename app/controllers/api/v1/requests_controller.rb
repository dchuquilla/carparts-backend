class Api::V1::RequestsController < ApplicationController
  include UniqueKeyGenerator

  before_action :set_request, only: %i[ show update destroy ]

  # GET /api/v1/requests
  def index
    @q = Request.ransack(params[:q])
    @requests = @q.result

    render json: @requests.map { |req| JSON.parse(req.to_json) }
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
      Chatbot::WebhookService.new(existing_requests.first, "/requests/#{existing_requests.first.show_key}").notify_request_duplicated
      render json: { error: I18n.t("requests.new.duplicated") }, status: :unprocessable_entity and return
    end

    @request = Request.new(request_params)

    if @request.save
      Chatbot::WebhookService.new(@request, "/requests/#{@request.show_key}").notify_request_success
      sleep(5)
      Chatbot::WebhookService.new(@request, "/requests/#{@request.show_key}").notify_request_image
      sleep(3)
      Chatbot::WebhookService.new(@request, "/requests/#{@request.show_key}").notify_request_chassis
      render json: @request, status: :created
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/requests/1
  def update
    if @request.update(request_params)
      Chatbot::WebhookService.new(@request, "/requests/#{@request.show_key}").notify_request_updated
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
      @request = if show_params[:id]
        Request.find(show_params[:id])
      else
        Request.find_by(show_key: show_params[:show_key])
      end
    end

    # Only allow a list of trusted parameters through.
    def request_params
      # params.require(:request).permit(:user_phone, :user_email, :user_name, :part_name, :part_brand, :part_model, :part_year)
      params.expect(request: [ :user_phone, :user_email, :user_name, :part_name, :part_brand, :part_model, :part_year, :part_image, :part_chassis ])
    end

    def show_params
      params.permit(:id, :show_key)
    end
end
