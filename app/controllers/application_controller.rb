# frozen_string_literal: true

class ApplicationController < ActionController::Base
  UsersHelper
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name surname date_of_birth gender])
  end
end
