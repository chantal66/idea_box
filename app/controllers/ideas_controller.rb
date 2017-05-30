class IdeasController < ApplicationController
  before_action :set_user, only: [:index, :new, :create]
  before_action :set_idea, only: [:show]

  def index
    @ideas = @user.ideas
  end

  def new
    @idea = @user.ideas.new
  end

  def create
    @idea = @user.ideas.new(idea_params)
    if @idea.save
      flash[:success] = "You have successfully created an Idea called #{@idea.title}"
      redirect_to user_idea_path(@user, @idea)
    else
      render :new
    end

  end

  def show
  end

  private

  def set_user
    @user = current_user
  end

  def set_idea
    @user = current_user
    @idea = @user.ideas.find(params[:id])
  end
  def idea_params
    params.require(:idea).permit(:title, :description, :image)
  end
end