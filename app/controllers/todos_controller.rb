# frozen_string_literal: true

class TodosController < BaseController
  before_action :todos, only: %i[index]

  def index
  end

  private

  def todos
    @todos ||= list.todos
  end

  def list
    @list ||= List.find(params[:list_id])
  end
end
