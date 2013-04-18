class RoundsController < ApplicationController

  # def show
  #   render "/stories/#{params[:story_id]}"
  # end

  def update
     Round.update(params[:round_id], :winner_id => params[:addition_id])
     redirect_to "/stories/#{params[:story_id]}"
  end
end
