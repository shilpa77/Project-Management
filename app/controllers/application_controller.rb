class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # rescue_from CanCan::AccessDenied do |exception|
    # redirect_to tasks_path, :alert => exception.message
  # end
  
  protected

  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
    registration_params = [:email, :role, :password, :password_confirmation]
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(registration_params) }
  end
    
end
