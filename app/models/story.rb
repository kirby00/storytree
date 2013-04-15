class Story < ActiveRecord::Base
  attr_accessible :content, :title, :user_id

  validates :user_id, presence: true

end
