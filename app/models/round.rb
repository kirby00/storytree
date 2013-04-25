class Round < ActiveRecord::Base
  attr_accessible :story_id, :winner_id

  has_many :additions
  belongs_to :story
  belongs_to :winner, :class_name => 'Addition'
end
