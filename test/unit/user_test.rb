require 'test_helper'
require_relative '../factories/user_factory'

class UserTest < ActiveSupport::TestCase

  test "should create story" do
    @user = UserFactory.create_user_with_story
    @user.save
    assert_not_nil @user.stories
  end

  test "should return winning additions" do
    # assert_not_nil, winning_additions
  end

  test "should return total votes won by user" do
    # assert_not_nil, votes_count
  end

end
