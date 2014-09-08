require 'test_helper'

class ChannelStatControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get app" do
    get :app
    assert_response :success
  end

end
