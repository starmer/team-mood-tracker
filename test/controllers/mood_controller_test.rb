require 'test_helper'

class MoodControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get overall" do
    get :overall
    assert_response :success
  end

  test "should get stats" do
    get :stats
    assert_response :success
  end

  test "should get notes" do
    get :notes
    assert_response :success
  end

end
