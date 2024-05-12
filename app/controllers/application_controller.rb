# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :locale

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
      new_user_session_path
    elsif resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  def locale
    I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end

  def default_url_options(options = {})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { locale: I18n.locale }
  end

  protected

  def devise_parameter_sanitizer
    if resource_class == User
      Users::ParameterSanitizer.new(User, :user, params)
    else
      super # Use the default one
    end
  end

  private

  def record_not_found
    respond_to do |format|
      format.json { render json: { error: 404 }, status: :not_found }
      format.html { render('admin/errors/not_found', status: :not_found, layout: 'errors') }
    end
  end
end
