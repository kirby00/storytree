class Addition < ActiveRecord::Base
  attr_accessible :content, :round_id, :user_id

  validates :round_id, :presence => true
  validates :user_id, :presence => true
  validates :content, :presence => true

  belongs_to :round
  belongs_to :user
  has_one :won_round, :class_name => 'Round', :foreign_key => :winner_id

  acts_as_voteable


end
