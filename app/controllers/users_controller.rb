class UsersController < ApplicationController
  before_action :assign_user, only: [:show, :edit, :destroy, :update]
  # before_action :verify_logged_in, except: [:new, :create]

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account created successfully!"
      session[:user_id] = @user.id
      redirect_to user_ideas_path(@user, @idea)
    else
      flash.now[:danger] = @user.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'Profile updated successfully'
      redirect_to user_path(@user)
    else
      flash.now[:danger] = @user.errors.full_messages.join(', ')
      render :edit
    end
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

  def assign_user
    @user = current_user
  end
end