# frozen_string_literal: true

class Admin::TodosController < Admin::BaseController
  before_action :todo, only: %i[show edit update destroy]
  before_action :todos, only: %i[index new readonly]

  def index
  end

  def new
    @todo = @list.todos.new
  end

  def show
  end

  def edit
  end

  def create
    @todo = list.todos.new(todo_params)
    if @todo.save
      redirect_to admin_root_path
    else
      render :new
    end
  end

  def update
    if @todo.update(todo_params)
      redirect_to admin_root_path
    else
      render :edit
    end
  end

  def destroy
    flash[:error] = @todo.errors.full_messages unless @todo.destroy
    redirect_to admin_root_path
  end

  def done
    if todo.update(status_id: Status.find_by(name: params[:status_name]).id)
      redirect_to admin_root_path, notice: 'Todo was mark as Complete.' if params[:status_name] == 'Complete'
      redirect_to admin_root_path, notice: 'Todo is back to Incomplete.' if params[:status_name] == 'Incomplete'
    else
      render admin_root_path, notice: ['Errors:', todo.errors.full_messages.join(',')].join
    end
  end

  def readonly
    render 'admin/todos/index_readonly'
  end

  private

  def todo
    @todo ||= list.todos.find(params[:id])
  end

  def todos
    @todos ||= list.todos
  end

  def list
    @list ||= if current_user.admin_role? || (current_user.user_role? && params[:action] == 'readonly')
      List.find(params[:list_id])
    else
      current_user.lists.find(params[:list_id])
    end
  end

  def todo_params
    params.require(:todo).permit(:name, :status_id)
  end
end
