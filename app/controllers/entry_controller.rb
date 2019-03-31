class EntryController < ApplicationController
  def show
    if current_admin?
      redirect_to admin_dashboard_path(current_user)
    elsif current_user
      redirect_to dashboard_path
    else
      redirect_to login_path
    end
  end
end
