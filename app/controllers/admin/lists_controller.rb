# frozen_string_literal: true

class Admin::ListsController < Admin::BaseController
  before_action :list, only: %i[show edit update destroy]

  def index
    @lists = current_user.lists.all
  end

  def new
    @list = current_user.lists.new
  end

  def show
  end

  def edit
  end

  def create
    @list = current_user.lists.new(list_params)
    if @list.save
      redirect_to admin_root_path
    else
      render :new
    end
  end

  def update
    if @list.update(list_params)
      redirect_to admin_root_path
    else
      render :edit
    end
  end

  def destroy
    flash[:error] = @list.errors.full_messages unless @list.destroy
    redirect_to admin_root_path
  end

  private

  def list
    @list ||= current_user.lists.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :access_id)
  end
end
