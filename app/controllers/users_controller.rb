class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    @stories = User.stories(@user)
    @additions = User.additions(@user)

    @story_count = User.story_count(@user)
    @addition_count = User.addition_count(@user)
    @winning_additions_count = User.winning_additions(@user)
    @total_votes = User.votes_count(@user)
  end
end