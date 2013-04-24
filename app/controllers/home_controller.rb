class HomeController < ApplicationController
  def index
    @story = Story.new
    @stories = Story.order("id DESC").limit(9)
  end
end
