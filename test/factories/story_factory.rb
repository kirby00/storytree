class StoryFactory

  class << self

    def without_user_id
      Story.new
    end
  end
end
