require 'test_helper'
require_relative '../factories/user_factory'

class UserTest < ActiveSupport::TestCase

  test "should create story" do
    @user = UserFactory.create_user_with_story
    @user.save
    assert_not_nil @user.stories
  end
end
