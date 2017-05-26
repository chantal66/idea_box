class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = 'Logged in Succesfully'
      redirect_to ideas_path
    else
      flash[:danger] = "Username or password incorrect"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end