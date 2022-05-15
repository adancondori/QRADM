require "test_helper"

class GroupSanctionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_sanction = group_sanctions(:one)
  end

  test "should get index" do
    get group_sanctions_url
    assert_response :success
  end

  test "should get new" do
    get new_group_sanction_url
    assert_response :success
  end

  test "should create group_sanction" do
    assert_difference('GroupSanction.count') do
      post group_sanctions_url, params: { group_sanction: { amount: @group_sanction.amount, date_done: @group_sanction.date_done, group_id: @group_sanction.group_id, sanction_id: @group_sanction.sanction_id, user_id: @group_sanction.user_id } }
    end

    assert_redirected_to group_sanction_url(GroupSanction.last)
  end

  test "should show group_sanction" do
    get group_sanction_url(@group_sanction)
    assert_response :success
  end

  test "should get edit" do
    get edit_group_sanction_url(@group_sanction)
    assert_response :success
  end

  test "should update group_sanction" do
    patch group_sanction_url(@group_sanction), params: { group_sanction: { amount: @group_sanction.amount, date_done: @group_sanction.date_done, group_id: @group_sanction.group_id, sanction_id: @group_sanction.sanction_id, user_id: @group_sanction.user_id } }
    assert_redirected_to group_sanction_url(@group_sanction)
  end

  test "should destroy group_sanction" do
    assert_difference('GroupSanction.count', -1) do
      delete group_sanction_url(@group_sanction)
    end

    assert_redirected_to group_sanctions_url
  end
end
