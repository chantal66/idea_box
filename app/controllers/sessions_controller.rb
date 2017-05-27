class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = 'Logged in Succesfully'
      redirect_to user_ideas_path(@user, @idea)
    else
      flash[:danger] = "Username or password incorrect"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:success] = 'Logged out Successfully'
    redirect_to root_path
  end
end