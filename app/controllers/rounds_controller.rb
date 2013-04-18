class RoundsController < ApplicationController

  def update
    # debugger
     Round.update(params[:id], :winner_id => params[:addition_id])
     redirect_to stories_path
  end
end
