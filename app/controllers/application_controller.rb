class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    posts_path
  end

  def index
  end

  def revert_check
    Check.find_by(user_id: current_user.id).destroy
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email]) # 注目
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
