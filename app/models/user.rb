class User < ActiveRecord::Base
  attr_accessible :name, :oauth_expires_at, :oauth_token, :provider, :uid
  has_many :stories
  has_many :additions
  has_many :winning_additions, :through => :stories, :source => :winning_additions
  has_many :votes, :through => :additions

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
end
