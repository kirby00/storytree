class StoryFactory

  class << self

    def without_user_id
      Story.new(:content => "content", :title => "something")
    end

    def without_content
      Story.new(:user_id => 1, :title => "something")
    end

    def without_title
      Story.new(:user_id => 1, :content => "something")
    end
  end
end
