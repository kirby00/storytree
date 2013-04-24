class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @stories = @user.stories
    @additions = @user.additions
  end
end