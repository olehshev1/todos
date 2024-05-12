# frozen_string_literal: true

class Admin::ErrorsController < ApplicationController
  layout 'errors'
  def not_found
    request.format = 'html' if request.format.class == Mime::NullType || %i[html json].exclude?(request.format.to_sym)
    respond_to do |format|
      format.json { render json: { error: 404 }, status: :not_found }
      format.html { render(status: :not_found) }
    end
  end
end
