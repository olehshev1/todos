# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  layout 'auth'
  # before_action :configure_sign_in_params, only: [:create]
  before_action :remove_flash_messages

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

  private

  def remove_flash_messages
    flash.delete(:alert) if session[:user_return_to] == admin_root_path && flash[:alert] == I18n.t('devise.failure.unauthenticated')
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
