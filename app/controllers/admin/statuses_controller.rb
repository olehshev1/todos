# frozen_string_literal: true

class Admin::StatusesController < Admin::BaseController
  before_action :status, only: %i[show edit update destroy]
  before_action :check_authorization_statuses

  def index
    @statuses = Status.all
  end

  def new
    @status = Status.new
  end

  def show
  end

  def edit
  end

  def create
    @status = Status.new(status_params)
    if @status.save
      redirect_to admin_statuses_path
    else
      render :new
    end
  end

  def update
    if @status.update(status_params)
      redirect_to admin_statuses_path
    else
      render :edit
    end
  end

  def destroy
    flash[:error] = @status.errors.full_messages unless @status.destroy
    redirect_to admin_statuses_path
  end

  private

  def check_authorization_statuses
    redirect_to root_path, notice: "You don't have  of authority to access statuses section" unless admin_role?
  end

  def status
    @status ||= Status.find(params[:id])
  end

  def status_params
    params.require(:status).permit(:name)
  end
end
