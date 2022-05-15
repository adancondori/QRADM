require "test_helper"

class GroupExtraPointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_extra_point = group_extra_points(:one)
  end

  test "should get index" do
    get group_extra_points_url
    assert_response :success
  end

  test "should get new" do
    get new_group_extra_point_url
    assert_response :success
  end

  test "should create group_extra_point" do
    assert_difference('GroupExtraPoint.count') do
      post group_extra_points_url, params: { group_extra_point: { amount: @group_extra_point.amount, date_done: @group_extra_point.date_done, extra_point_id: @group_extra_point.extra_point_id, group_id: @group_extra_point.group_id } }
    end

    assert_redirected_to group_extra_point_url(GroupExtraPoint.last)
  end

  test "should show group_extra_point" do
    get group_extra_point_url(@group_extra_point)
    assert_response :success
  end

  test "should get edit" do
    get edit_group_extra_point_url(@group_extra_point)
    assert_response :success
  end

  test "should update group_extra_point" do
    patch group_extra_point_url(@group_extra_point), params: { group_extra_point: { amount: @group_extra_point.amount, date_done: @group_extra_point.date_done, extra_point_id: @group_extra_point.extra_point_id, group_id: @group_extra_point.group_id } }
    assert_redirected_to group_extra_point_url(@group_extra_point)
  end

  test "should destroy group_extra_point" do
    assert_difference('GroupExtraPoint.count', -1) do
      delete group_extra_point_url(@group_extra_point)
    end

    assert_redirected_to group_extra_points_url
  end
end
