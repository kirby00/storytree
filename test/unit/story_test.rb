require 'test_helper'
require_relative '../factories/story_factory'

class StoryTest < ActiveSupport::TestCase

  test "story has user id" do
    story = StoryFactory.without_user_id
    assert !story.save
  end
end
