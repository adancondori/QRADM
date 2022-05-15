require "test_helper"

class GroupActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_activity = group_activities(:one)
  end

  test "should get index" do
    get group_activities_url
    assert_response :success
  end

  test "should get new" do
    get new_group_activity_url
    assert_response :success
  end

  test "should create group_activity" do
    assert_difference('GroupActivity.count') do
      post group_activities_url, params: { group_activity: { activity_id: @group_activity.activity_id, amount: @group_activity.amount, date_done: @group_activity.date_done, group_id: @group_activity.group_id, observation: @group_activity.observation, user_id: @group_activity.user_id } }
    end

    assert_redirected_to group_activity_url(GroupActivity.last)
  end

  test "should show group_activity" do
    get group_activity_url(@group_activity)
    assert_response :success
  end

  test "should get edit" do
    get edit_group_activity_url(@group_activity)
    assert_response :success
  end

  test "should update group_activity" do
    patch group_activity_url(@group_activity), params: { group_activity: { activity_id: @group_activity.activity_id, amount: @group_activity.amount, date_done: @group_activity.date_done, group_id: @group_activity.group_id, observation: @group_activity.observation, user_id: @group_activity.user_id } }
    assert_redirected_to group_activity_url(@group_activity)
  end

  test "should destroy group_activity" do
    assert_difference('GroupActivity.count', -1) do
      delete group_activity_url(@group_activity)
    end

    assert_redirected_to group_activities_url
  end
end
