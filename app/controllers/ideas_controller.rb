class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
    @user = current_user
  end
end