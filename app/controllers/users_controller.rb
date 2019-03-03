class UsersController < ApplicationController
  before_action :require_login, only: [:show, :edit]
  before_action :require_current_user, only: [:show, :edit]

	def new
		@user = User.new
	end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:message] = "Thank you for registering! You are now logged in."
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash[:alert] = "Email already taken. Please try again or log in with an existing account."
      @user.email = ""
      render :new
    end
  end

  def show
    @user = current_user
  end

	# def index
	# 	@users = User.all
	# end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :location, :state, :password_confirmation)
  end

  def require_login
    unless logged_in?
      flash[:error] = "The page you were looking for doesn't exist."
      redirect_to 'public/404'
    end
  end

  def logged_in?
    if session[:user_id]
      true
    end
  end
end
