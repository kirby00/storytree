require 'test_helper'

class StoriesControllerTest < ActionController::TestCase

 # def setup
  #  @story = Story.new
  #  @story.save
 # end

  test "should get new" do
    get :new
    assert_response :success
  end


  test "should create story" do
    assert_difference('Story.count') do
      post :create, story: {  }
    end

    assert_redirected_to story_path(assigns(:story))
  end

  test "should show" do
    get :show, id: @story
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stories)
  end

end

