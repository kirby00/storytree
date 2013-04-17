class StoriesController < ApplicationController

  def new
    @story = Story.new
  end

  def create
    @user = current_user
    @story = @user.stories.create(params[:story])
    Round.create({story_id: @story.id})
    redirect_to story_path(@story)
  end

  def show
    @story = Story.find(params[:id])

    last_round = @story.rounds.last
    @additions = last_round.additions.all
    @addition = Addition.new
  end

  def index
    @stories = Story.all
  end

end
