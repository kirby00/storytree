class Story < ActiveRecord::Base
  attr_accessible :content, :title, :user_id
  belongs_to :user

  has_many :rounds, :include => :additions

  has_many :winning_additions, :through => :rounds, :source => :winner

  validates :user_id, :title, :content, presence: true
end
