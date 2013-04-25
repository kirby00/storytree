class HomeController < ApplicationController
  def index
    @story = Story.new
    @stories = Story.limit(6)
  end

  def about
  end
end
