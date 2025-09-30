module Api
  module V1
    class RequestsController < ApplicationController
      include UniqueKeyGenerator
      include Pagy::Backend

      before_action :authenticate_user!, except: %i[show create update filter]

      before_action :set_request, only: %i[ show update destroy ]

      # GET /api/v1/requests
      def index
        search = Request.unaccepted.ransack(ransack_params)

        scope = search.result

        pagy_obj, requests = pagy(scope, page: params[:page], items: params[:per_page] || 20)

        render json: {
          requests: requests.as_json(only: %i[id part_name part_model part_brand part_year part_image part_chassis show_key], methods: %i[formatted_created_at]),
          meta: {
            page: pagy_obj.page,
            per_page: pagy_obj.limit,
            pages: pagy_obj.pages,
            count: pagy_obj.count,
            car_brands: Request.car_brands.map(&:part_brand),
            car_models: Request.car_models.map(&:part_model),
            car_years: Request.car_years.map(&:part_year),
          },
          sort: search.sorts.map(&:to_s)
        }
      end

      # GET /api/v1/filter
      def filter
        search = Request.unaccepted.ransack(ransack_params)

        scope = search.result

        pagy_obj, requests = pagy(scope, page: params[:page], items: params[:per_page] || 20)

        render json: {
          requests: requests.as_json(only: %i[id part_name part_model part_brand part_year part_image part_chassis show_key], methods: %i[formatted_created_at]),
          meta: {
            page: pagy_obj.page,
            per_page: pagy_obj.limit,
            pages: pagy_obj.pages,
            count: pagy_obj.count,
            car_brands: Request.car_brands.map(&:part_brand),
            car_models: Request.car_models.map(&:part_model),
            car_years: Request.car_years.map(&:part_year),
          },
          sort: search.sorts.map(&:to_s)
        }
      end

      # GET /api/v1/requests/1
      def show
        render json: @request.as_json(
          include: show_params[:id] ? nil : { proposals: { 
            except: %i[request_id user_id updated_at price currency], 
            methods: %i[formatted_price formatted_created_at] }},
          except: %i[digest_key id user_phone user_email user_name show_key updated_at],
          methods: %i[formatted_created_at]
        ), serializer: nil
      end

      # POST /api/v1/requests
      def create
        uniq_key = get_uniq_key(request_params.values.join("-"))
        existing_requests = Request.by_today_uniq_key(uniq_key)

        if existing_requests.any?
          Chatbot::WebhookService.new({ request: existing_requests.first, url: "/requests/#{existing_requests.first.show_key}" }).notify_request_duplicated
          render json: { error: I18n.t("requests.new.duplicated") }, status: :unprocessable_entity and return
        end

        @request = Request.new(request_params)

        if @request.save
          Chatbot::WebhookService.new({ request: @request, url: "/requests/#{@request.id}" }).notify_request_store
          
          car_owner_chat = Chatbot::WebhookService.new({ request: @request, url: "/requests/#{@request.show_key}" })
          car_owner_chat.notify_request_success; sleep(5)
          car_owner_chat.notify_request_image; sleep(3)
          car_owner_chat.notify_request_chassis
          render json: @request, status: :created
        else
          Chatbot::WebhookService.new({ request: @request, message: @request.errors.join("\n") }).notify_request_message
          render json: @request.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/requests/1
      def update
        if @request.update(request_params)
          Chatbot::WebhookService.new({ request: @request, url: "/requests/#{@request.show_key}" }).notify_request_updated
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
          Request.includes(:proposals)
            .find_by(show_key: show_params[:show_key])
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

      def ransack_params
        params.fetch(:q, {}).permit(
          :s, # sorting, e.g. "part_year desc, part_brand asc"
          :part_name_cont,
          :part_model_cont,
          :part_brand_cont,
          :part_year_eq,
          :user_phone_eq,
          :part_year_gteq,
          :part_year_lteq
        )
      end
    end
  end
end
