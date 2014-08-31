require 'test_helper'

class PasswordControllerTest < ActionController::TestCase
  test "should get reset" do
    get :reset
    assert_response :success
  end

end
