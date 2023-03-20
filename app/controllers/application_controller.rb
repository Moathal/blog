class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :clear_session

  def clear_session
   session.delete(:error) if request.method != 'POST' 
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :bio, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :bio, :photo])
  end
end