class Round < ActiveRecord::Base
  attr_accessible :story_id, :winner_id

  has_many :additions
end
