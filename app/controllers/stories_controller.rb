class StoriesController < ApplicationController

  def new
    @story = Story.new
  end

  def create
    @user = current_user
    @story = @user.stories.create(params[:story])
    redirect_to story_path(@story)
  end

  def show
    @story = Story.find(params[:id])
  end

  def index
    @stories = Story.all
  end

end
