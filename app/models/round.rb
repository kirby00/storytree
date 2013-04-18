class Round < ActiveRecord::Base
  attr_accessible :story_id, :winner_id

  has_many :additions
  belongs_to :story


  def self.get_winner_ids(story)
    rounds = self.where("story_id = ? AND winner_id IS NOT NULL", story.id)
    winners = []
    rounds.each do |round|
      winners << round.winner_id
    end
    winners
  end

end
