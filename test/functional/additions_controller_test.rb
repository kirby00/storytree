require 'test_helper'
require_relative '../factories/round_factory'

class AdditionsControllerTest < ActionController::TestCase
  test "addition can create round" do
    user = User.create(:provider => "facebook", :uid => "uid", :name => "user1" )
    story = Story.create(:user_id => user.id, :title => "title", :content => "content")
    round = Round.create(:story_id => story.id, :winner_id => user.id)
    post :create, :addition => {:user_id => user.id, :story_id => story.id, :content => "content"}
    assert_equal 2, Round.count
  end

end







