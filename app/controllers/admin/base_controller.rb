# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_authorization

  layout 'backend'

  private

  def check_authorization
    redirect_to root_path, notice: "You don't have  of authority to access admin dashboard" unless admin_role? || user_role?
  end

  def admin_role?
    current_user.admin_role?
  end

  def user_role?
    current_user.user_role?
  end
end
