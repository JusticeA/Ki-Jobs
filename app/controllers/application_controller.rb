class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:company_name, :email, :company_profile, :address, :username, :experience, :picture])
    devise_parameter_sanitizer.permit(:account_update, keys: [:company_name, :company_profile, :email, :address, :username, :experience, :picture])
  end

end
