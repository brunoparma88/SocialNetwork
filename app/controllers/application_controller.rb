# frozen_string_literal: true
class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  #
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up) do |user_params|
  #     user_params.permit({ roles: [] }, :email, :password, :password_confirmation)
  #   end
  # end
  protect_from_forgery with: :null_session
  helper_method :current_user
  helper_method :logged_in?
  def current_user
    User.find_by(id: session[:user_id])
  end
  def logged_in?
    !current_user.nil?
  end
end
