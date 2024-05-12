# frozen_string_literal: true

class Admin::HomeController < Admin::BaseController
  def show
    @lists = current_user.lists.paginate(page: params[:page], per_page: 2) if current_user.user_role?
    @lists = List.all.paginate(page: params[:page], per_page: 2) if current_user.admin_role?
    @todo = Todo.new
  end

  def readonly
    if current_user.admin_role? || current_user.user_role?
      @lists = List.joins(:access).where(accesses: { name: 'Public' })
                   .or(List.joins(:access).where(accesses: { name: 'Protect' }))
                   .paginate(page: params[:page], per_page: 2)
    end
  end
end
