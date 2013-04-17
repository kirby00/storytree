class AdditionsController < ApplicationController
  def new
    @addition = Addition.new
    #@user = current_user
  end

  def create
    user = current_user
    round = Round.find_all_by_story_id(params[:story_id]).last
    #round = Story.find(params[:addition][:story_id]).rounds.last
    if round.winner_id != nil
      new_round = Round.create({:story_id => params[:story_id]})
      Addition.create({round_id: new_round.id, user_id: user.id, content: params[:addition][:content]})
    else
      Addition.create({round_id: round.id, user_id: user.id, content: params[:addition][:content]})
    end
    redirect_to "/stories/#{params[:story_id]}"
  end

  def index
  end
end
