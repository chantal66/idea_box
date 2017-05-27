class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :verify_logged_in, :current_admin?

  def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # @user = User.find(session[:user_id]) if session[:user_id]
  end

  def verify_logged_in
    render file: '/public/404.html' unless current_user
  end

  def current_admin?
    current_user && current_user.admin?
  end
end
