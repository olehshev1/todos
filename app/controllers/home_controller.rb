# frozen_string_literal: true

class HomeController < BaseController
  def show
    @lists = List.joins(:access).where(accesses: { name: 'Public' })
                 .paginate(page: params[:page], per_page: 3)
  end
end
