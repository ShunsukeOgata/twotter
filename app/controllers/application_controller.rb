class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) << :name
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
    devise_parameter_sanitizer.for(:sign_in) << :account
    devise_parameter_sanitizer.for(:sign_up) << :account
    devise_parameter_sanitizer.for(:account_update) << :account
    devise_parameter_sanitizer.for(:sign_in) << :icon
    devise_parameter_sanitizer.for(:sign_up) << :icon
    devise_parameter_sanitizer.for(:account_update) << :icon

  end
end
