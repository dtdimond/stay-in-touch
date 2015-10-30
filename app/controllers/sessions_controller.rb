class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      flash[:success] = "Login Success."
      redirect_to root_path
    else
      flash[:danger] = "There was a problem with logging in."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You've logged out."
    redirect_to root_path
  end

end
