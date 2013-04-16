class StoriesController < ApplicationController

  def new
    @story = Story.new
  end

  def create
    @user = current_user
    @story = @user.stories.create(params[:story])
    redirect_to story_path(@story)
    Round.create({story_id: @story.id})
  end

  def show
    @story = Story.find(params[:id])
    @addition = Addition.new
  end

end
