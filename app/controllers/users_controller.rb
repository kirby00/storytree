class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @stories = User.stories(@user)
    @additions = User.additions(@user)
  end
end