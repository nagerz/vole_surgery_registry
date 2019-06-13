class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :current_researcher?, :current_admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def current_researcher?
    current_user && current_user.researcher?
  end

  def require_admin
    render file: 'errors/not_found', status: 404 unless current_admin?
  end

  def require_current_user
    render file: 'errors/not_found', status: 404 unless current_researcher?
  end
end
