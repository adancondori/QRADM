require "test_helper"

class ExtraPointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @extra_point = extra_points(:one)
  end

  test "should get index" do
    get extra_points_url
    assert_response :success
  end

  test "should get new" do
    get new_extra_point_url
    assert_response :success
  end

  test "should create extra_point" do
    assert_difference('ExtraPoint.count') do
      post extra_points_url, params: { extra_point: { amount: @extra_point.amount, description: @extra_point.description, event_id: @extra_point.event_id, name: @extra_point.name } }
    end

    assert_redirected_to extra_point_url(ExtraPoint.last)
  end

  test "should show extra_point" do
    get extra_point_url(@extra_point)
    assert_response :success
  end

  test "should get edit" do
    get edit_extra_point_url(@extra_point)
    assert_response :success
  end

  test "should update extra_point" do
    patch extra_point_url(@extra_point), params: { extra_point: { amount: @extra_point.amount, description: @extra_point.description, event_id: @extra_point.event_id, name: @extra_point.name } }
    assert_redirected_to extra_point_url(@extra_point)
  end

  test "should destroy extra_point" do
    assert_difference('ExtraPoint.count', -1) do
      delete extra_point_url(@extra_point)
    end

    assert_redirected_to extra_points_url
  end
end
