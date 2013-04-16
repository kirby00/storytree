class StoriesController < ApplicationController

  def new
    @story = Story.new
  end

  def create
    @user = current_user
    @user.stories.create(params[:story])
    redirect_to story_path(@story)
  end

  def show
    @story = Story.find(params[:user_id])
  end

end
