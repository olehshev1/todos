# frozen_string_literal: true

class Users::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:username])
    permit(:account_update, keys: %i[username avatar])
  end
end
