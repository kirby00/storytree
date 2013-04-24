class AdditionsController < ApplicationController

  def new
    @addition = Addition.new
  end

  def create
    if request.xhr?

      addition = (params.slice("story_id"))
      addition[:content] = params[:addition][:content]
      addition[:story_id] = addition[:story_id].to_i
      round = Round.find_all_by_story_id(addition[:story_id]).last

      if round.winner_id != nil
        new_round = Round.create({:story_id => addition[:story_id]})
        @addition = Addition.create({round_id: new_round.id, user_id: current_user.id, content: addition[:content]})
      else
        @addition = Addition.create({round_id: round.id, user_id: current_user.id, content: addition[:content]})
      end

      if @addition.save
        render :json => { :status => 'true',
                          :content => @addition.content,
                          :addition_id => @addition.id
                        }
      else
        render :json => { :status => 'false' }
      end
    end
  end

    def vote_true
      @addition = Addition.find(params[:id])
      vote = current_user.vote_for(@addition)
      votes = Vote.find_all_by_voteable_id(vote.voteable_id)
      Round.update(@addition.round_id, :winner_id => vote.voteable_id) if votes.count == 2
      redirect_to :back
    end
end