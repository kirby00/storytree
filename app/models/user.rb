class User < ActiveRecord::Base
  attr_accessible :name, :oauth_expires_at, :oauth_token, :provider, :uid
  has_many :stories
  has_many :additions

  acts_as_voter

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
  end

  def self.stories(user)
    Story.find_all_by_user_id(user.id)
  end

  def self.additions(user)
    Addition.find_all_by_user_id(user.id)
  end

  def self.story_count(user)
    stories(user).count
  end

  def self.addition_count(user)
    additions(user).count
  end

  def self.winning_additions(user)
    Round.where(["winner_id IN (?)", user.additions.map(&:id)]).count
  end

  def self.votes_count(user)
    Vote.where(["voteable_id IN (?)", user.additions.map(&:id)]).count
  end
end
