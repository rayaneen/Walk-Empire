require "test_helper"

class ControlPointsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get control_points_index_url
    assert_response :success
  end

  test "should get show" do
    get control_points_show_url
    assert_response :success
  end
end
