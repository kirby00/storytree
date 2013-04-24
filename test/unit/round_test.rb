require 'test_helper'
require_relative '../factories/story_factory'
require_relative '../factories/round_factory'


class RoundTest < ActiveSupport::TestCase

  test "should return winners" do
    StoryFactory.with_winner
    RoundFactory.round_with_winner
    get_winner_ids()
    # assert winners != nil
  end

end
