require 'test_helper'

class LendersControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

end
