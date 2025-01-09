require "test_helper"

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get user" do
    get dashboards_user_url
    assert_response :success
  end
end
