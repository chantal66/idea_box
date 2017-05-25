class UsersController < ApplicationController
  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account created successfully!"
      session[:user_id] = @user.id
      redirect_to ideas_path
    else
      flash.now[:danger] = @user.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user.destroy
    session.clear
    flash[:success] = 'Profile deleted succesfully'
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end


end