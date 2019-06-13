class UsersController < ApplicationController
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

end
