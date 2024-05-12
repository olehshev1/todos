# frozen_string_literal: true

module ApplicationHelper
  def flash_class(key)
    case key
    when 'notice' then 'alert alert-success'
    when 'success' then 'alert alert-success'
    when 'error' then 'alert alert-danger'
    when 'alert' then 'alert alert-danger'
    else
      ''
    end
  end
end
