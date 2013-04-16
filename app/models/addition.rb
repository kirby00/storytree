class Addition < ActiveRecord::Base
  attr_accessible :content, :round_id, :user_id

  validates :round_id, :presence => true
  validates :user_id, :presence => true
  validates :content, :presence => true

end
