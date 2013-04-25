class StoriesController < ApplicationController

  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
  end

  def create
    if @user = current_user
      @story = @user.stories.create(params[:story])
      redirect_to story_path(@story)
      Round.create({story_id: @story.id})

      @user.facebook.put_wall_post(
        "I just started a story on story-tree.co.uk",
        {
          :name => @story.title,
          :description => @story.content,
          :picture => "http://www.story-tree.co.uk/assets/story_tree_logo_transparent.png",
          :link => "http://www.story-tree.co.uk/stories/#{@story.id}"
        })
    else
      redirect_to root_url
    end
  end

  def show
    @story = Story.find(params[:id])
    @last_round = @story.rounds.last
    @additions = @last_round.additions.order("id DESC")
    @addition = Addition.new
    @successful_additions = @story.winning_additions
  end
end
