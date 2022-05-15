require "test_helper"

class ActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @activity = activities(:one)
  end

  test "should get index" do
    get activities_url
    assert_response :success
  end

  test "should get new" do
    get new_activity_url
    assert_response :success
  end

  test "should create activity" do
    assert_difference('Activity.count') do
      post activities_url, params: { activity: { amount: @activity.amount, code: @activity.code, date_end: @activity.date_end, date_init: @activity.date_init, description: @activity.description, event_id: @activity.event_id, is_close: @activity.is_close, is_visible: @activity.is_visible, name: @activity.name, rules: @activity.rules, state: @activity.state } }
    end

    assert_redirected_to activity_url(Activity.last)
  end

  test "should show activity" do
    get activity_url(@activity)
    assert_response :success
  end

  test "should get edit" do
    get edit_activity_url(@activity)
    assert_response :success
  end

  test "should update activity" do
    patch activity_url(@activity), params: { activity: { amount: @activity.amount, code: @activity.code, date_end: @activity.date_end, date_init: @activity.date_init, description: @activity.description, event_id: @activity.event_id, is_close: @activity.is_close, is_visible: @activity.is_visible, name: @activity.name, rules: @activity.rules, state: @activity.state } }
    assert_redirected_to activity_url(@activity)
  end

  test "should destroy activity" do
    assert_difference('Activity.count', -1) do
      delete activity_url(@activity)
    end

    assert_redirected_to activities_url
  end
end
