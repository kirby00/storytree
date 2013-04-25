require 'test_helper'
require_relative '../factories/round_factory'

class AdditionsControllerTest < ActionController::TestCase

  test "addition can create round" do
    user = User.create(:provider => "facebook", :uid => "uid", :name => "user1" )
    story = Story.create(:user_id => user.id, :title => "title", :content => "content")
    RoundFactory.round_with_winner

    # round = Round.create(:story_id => story.id, :winner_id => addition.id)
    post :create, :addition => {:user_id => user.id, :story_id => 1, :content => "content"}
    assert_equal 2, Round.count
  end

  test "addition can be added to round" do
    user = User.create(:provider => "facebook", :uid => "uid", :name => "user1" )
    story = Story.create(:user_id => user.id, :title => "title", :content => "content")
    RoundFactory.round_without_winner
    # round = Round.create(:story_id => story.id)
    post :create, :addition => {:user_id => user.id, :story_id => story.id, :content => "content"}
    assert_equal 1, Round.count
  end

end







