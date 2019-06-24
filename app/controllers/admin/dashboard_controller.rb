class Admin::DashboardController < Admin::BaseController
  before_action :require_admin, only: [:show, :edit]

  def show
    @user = current_user
    @voles = Vole.all
  end
end
