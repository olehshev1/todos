# frozen_string_literal: true

class Admin::AccessesController < Admin::BaseController
  before_action :access, only: %i[show edit update destroy]
  before_action :check_authorization_accesses

  def index
    @accesses = Access.all
  end

  def new
    @access = Access.new
  end

  def show
  end

  def edit
  end

  def create
    @access = Access.new(access_params)
    if @access.save
      redirect_to admin_accesses_path
    else
      render :new
    end
  end

  def update
    if @access.update(access_params)
      redirect_to admin_accesses_path
    else
      render :edit
    end
  end

  def destroy
    flash[:error] = @access.errors.full_messages unless @access.destroy
    redirect_to admin_accesses_path
  end

  private

  def check_authorization_accesses
    redirect_to root_path, notice: "You don't have  of authority to access accesses section" unless admin_role?
  end

  def access
    @access ||= Access.find(params[:id])
  end

  def access_params
    params.require(:access).permit(:name)
  end
end
