# frozen_string_literal: true

class UserMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  # default template_path: 'users/mailer' # to make sure that your mailer uses the devise views

  def headers_for(action, opts)
    super.merge!(template_path: 'users/mailer')
  end
end
