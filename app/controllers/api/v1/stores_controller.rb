class Api::V1::StoresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_store, only: [ :show, :update ]

  def show
    if store
      render json: @store, status: :ok
    else
      render json: { error: "Store not found" }, status: :not_found
    end
  end

  def create
    store = Store.new(store_params.merge(user_id: current_user.id))

    if store.save
      render json: store, status: :created
    else
      render json: { errors: store.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if store
      if @store.update(store_params)
        render json: @store, status: :ok
      else
        render json: { errors: @store.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "Store not found" }, status: :not_found
    end
  end

  private

  def store_params
    params.require(:store).permit(:name, :description, :contact_email, :contact_phone, :address, :user_id)
  end

  def set_store
    @store = Store.find_by(id: params[:id], user_id: current_user.id)
    render json: { error: "Store not found" }, status: :not_found unless @store
  end
end
