require "application_system_test_case"

class GroupExtraPointsTest < ApplicationSystemTestCase
  setup do
    @group_extra_point = group_extra_points(:one)
  end

  test "visiting the index" do
    visit group_extra_points_url
    assert_selector "h1", text: "Group Extra Points"
  end

  test "creating a Group extra point" do
    visit group_extra_points_url
    click_on "New Group Extra Point"

    fill_in "Amount", with: @group_extra_point.amount
    fill_in "Date done", with: @group_extra_point.date_done
    fill_in "Extra point", with: @group_extra_point.extra_point_id
    fill_in "Group", with: @group_extra_point.group_id
    click_on "Create Group extra point"

    assert_text "Group extra point was successfully created"
    click_on "Back"
  end

  test "updating a Group extra point" do
    visit group_extra_points_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @group_extra_point.amount
    fill_in "Date done", with: @group_extra_point.date_done
    fill_in "Extra point", with: @group_extra_point.extra_point_id
    fill_in "Group", with: @group_extra_point.group_id
    click_on "Update Group extra point"

    assert_text "Group extra point was successfully updated"
    click_on "Back"
  end

  test "destroying a Group extra point" do
    visit group_extra_points_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Group extra point was successfully destroyed"
  end
end
