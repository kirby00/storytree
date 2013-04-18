class RoundsController < ApplicationController

  def update
     Round.update(params[:id], :winner_id => params[:addition_id])
     redirect_to :back
  end
end
