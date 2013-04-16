class UserFactory

  class << self

    def create_user_with_story
      @user = User.new
      @user.stories.new(:title => "title", :content => "content")
      @user
    end



  end
end