class Story < ActiveRecord::Base
  attr_accessible :content, :title, :user_id
  belongs_to :user

  validates :user_id, :title, :content, presence: true
end
