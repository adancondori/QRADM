require "application_system_test_case"

class GroupActivitiesTest < ApplicationSystemTestCase
  setup do
    @group_activity = group_activities(:one)
  end

  test "visiting the index" do
    visit group_activities_url
    assert_selector "h1", text: "Group Activities"
  end

  test "creating a Group activity" do
    visit group_activities_url
    click_on "New Group Activity"

    fill_in "Activity", with: @group_activity.activity_id
    fill_in "Amount", with: @group_activity.amount
    fill_in "Date done", with: @group_activity.date_done
    fill_in "Group", with: @group_activity.group_id
    fill_in "Observation", with: @group_activity.observation
    fill_in "User", with: @group_activity.user_id
    click_on "Create Group activity"

    assert_text "Group activity was successfully created"
    click_on "Back"
  end

  test "updating a Group activity" do
    visit group_activities_url
    click_on "Edit", match: :first

    fill_in "Activity", with: @group_activity.activity_id
    fill_in "Amount", with: @group_activity.amount
    fill_in "Date done", with: @group_activity.date_done
    fill_in "Group", with: @group_activity.group_id
    fill_in "Observation", with: @group_activity.observation
    fill_in "User", with: @group_activity.user_id
    click_on "Update Group activity"

    assert_text "Group activity was successfully updated"
    click_on "Back"
  end

  test "destroying a Group activity" do
    visit group_activities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Group activity was successfully destroyed"
  end
end
