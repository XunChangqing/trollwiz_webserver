require 'test_helper'

class DomainNamesControllerTest < ActionController::TestCase
  test "should get get_update_logs" do
    get :get_update_logs
    assert_response :success
  end

end
