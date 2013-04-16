class AdditionsController < ApplicationController
  def new
  end

  def create
    round = Round.find_all_by_story_id(params[:addition][:story_id]).last #Story.find(params[:story_id]).rounds.last
    # debugger

    if round.winner_id != null

      new_round = Round.create(:params['story_id'])
      Addition.create(round_id: new_round.id, user_id: params['user_id'], content: params['content'])

    else

     Addition.create(round_id: round.id, user_id: params['user_id'], content: params['content'])

    end
  end

  def index
  end
end
