class SessionsController < ApplicationController
  helper_method :is_logged_in

  def new
    if current_user
      is_logged_in
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      if user.active?
        session[:user_id] = user.id
        flash[:alert] = "You have been logged in."
        direct_to(user)

      else
        flash[:alert] = "This account has been disabled. Please contact an administrator for help."
        render :new
      end
    else
      flash[:alert] = "Login failed. Please check your email address and password."
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

  private

  def direct_to(user)
    if user.researcher?
      redirect_to dashboard_path
    elsif user.admin?
      redirect_to admin_dashboard_path(user)
    end
  end

  def is_logged_in
    if current_researcher?
      redirect_to dashboard_path
      flash[:alert] = "You are aleady logged in."
    elsif current_admin?
      redirect_to admin_dashboard_path(current_user)
      flash[:alert] = "You are aleady logged in."
    end
  end

end
