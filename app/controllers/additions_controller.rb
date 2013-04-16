class AdditionsController < ApplicationController
  def new
  end

  def create

    round = Round.find_all_by_story_id(params[:addition][:story_id]).last
    #round = Story.find(params[:addition][:story_id]).rounds.last

    if round.winner_id != nil

      new_round = Round.create({:story_id => params[:addition][:story_id]})
      Addition.create({round_id: new_round.id, user_id: params[:addition][:user_id], content: params[:addition][:content]})

    else

     Addition.create({round_id: round.id, user_id: params[:addition][:user_id], content: params[:addition][:content]})

    end
  end

  def index
  end
end
