# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  respond_to :json

  private

  def respond_with(resource, _opts = {})
    response.set_header('Access-Control-Expose-Headers', 'authorization')
    render json: { message: I18n.t("devise.sessions.signed_in"), user: resource }, status: :ok
  end

  def respond_to_on_destroy
    if current_user
      render json: { message: I18n.t("devise.sessions.signed_out") }, status: :ok
    else
      render json: { error: "User not found" }, status: :unauthorized
    end
  end
end
