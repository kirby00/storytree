require 'test_helper'
require_relative '../factories/story_factory'

class StoryTest < ActiveSupport::TestCase

  test "story has user id" do
    story = StoryFactory.without_user_id
    assert !story.save
  end

  test "story has content" do
    story = StoryFactory.without_content
    assert !story.save
  end

  test "story has title" do
    story = StoryFactory.without_title
    assert !story.save
  end

end
