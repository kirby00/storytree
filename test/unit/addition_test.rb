require 'test_helper'

class AdditionTest < ActiveSupport::TestCase

  test "has round_id" do
    addition = Addition.new(:user_id => 1, :content => "content")
    assert !addition.save
  end

  test "has user_id" do
    addition = Addition.new(:round_id => 1, :content => "content")
    assert !addition.save
  end

  test "has content" do
    addition = Addition.new(:user_id => 1, :round_id => 1)
    assert !addition.save
  end

end
