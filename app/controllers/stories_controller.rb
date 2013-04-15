class StoriesController < ApplicationController

  def new
    @story = Story.new
  end

  def create
    @story = Story.create(params[:story])
    redirect_to story_path(@story)
  end

  def show
    @story = Story.find(params[:id])
  end

end
