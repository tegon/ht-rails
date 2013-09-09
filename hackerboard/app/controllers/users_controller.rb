class UsersController < ApplicationController
  layout "window"

  def show
    @user = User.find(params[:id])
    render layout: "application"
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    signup = Signup.new(@user, login_url)

    if signup.complete
      flash[:notice] = t('flash.users.create.notice')
      redirect_to login_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end