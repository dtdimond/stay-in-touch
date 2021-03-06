class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Registration success. Welcome #{@user.name}"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :name)
  end

end
