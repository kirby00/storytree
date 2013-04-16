require 'test_helper'
require_relative '../factories/round_factory'

class AdditionsControllerTest < ActionController::TestCase
  test "addition can create round" do
    post :create, :addition => {:user_id => 1, :story_id => 1, :content => "content"}
    round = RoundFactory.round_with_winner
    assert_equal 2, Round.count
  end

end







