# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    build_resource(sign_up_params)
    resource.skip_confirmation_notification!  # Prevent sending the confirmation email
    resource.save  # Ensure the resource is saved to generate the confirmation token
    if resource.confirmation_token.present?
      # Send the confirmation token to a notification service
      Chatbot::WebhookService.new({ store: resource, url: "/stores/confirm/#{resource.confirmation_token}" }).notify_new_store
    end

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        render json: { message: "User registered successfully", user: resource }, status: :created
      else
        expire_data_after_sign_in!
        render json: { message: "Signed up successfully but inactive", user: resource }, status: :created
      end
    else
      clean_up_passwords resource
      render json: { error: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: { message: "User registered successfully", user: resource }, status: :created
    else
      render json: { error: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :phone, :store_name, :store_uid)
  end
end
