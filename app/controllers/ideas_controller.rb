class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
    @user = current_user
  end

  def new
    # @user = current_user
    # @idea = @user.Idea.new
  end
end