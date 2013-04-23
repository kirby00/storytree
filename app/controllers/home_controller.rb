class HomeController < ApplicationController
  def index
    @stories = Story.order("id DESC").limit(9)
  end
end
