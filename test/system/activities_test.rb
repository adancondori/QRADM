require "application_system_test_case"

class ActivitiesTest < ApplicationSystemTestCase
  setup do
    @activity = activities(:one)
  end

  test "visiting the index" do
    visit activities_url
    assert_selector "h1", text: "Activities"
  end

  test "creating a Activity" do
    visit activities_url
    click_on "New Activity"

    fill_in "Amount", with: @activity.amount
    fill_in "Code", with: @activity.code
    fill_in "Date end", with: @activity.date_end
    fill_in "Date init", with: @activity.date_init
    fill_in "Description", with: @activity.description
    fill_in "Event", with: @activity.event_id
    check "Is close" if @activity.is_close
    check "Is visible" if @activity.is_visible
    fill_in "Name", with: @activity.name
    fill_in "Rules", with: @activity.rules
    check "State" if @activity.state
    click_on "Create Activity"

    assert_text "Activity was successfully created"
    click_on "Back"
  end

  test "updating a Activity" do
    visit activities_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @activity.amount
    fill_in "Code", with: @activity.code
    fill_in "Date end", with: @activity.date_end
    fill_in "Date init", with: @activity.date_init
    fill_in "Description", with: @activity.description
    fill_in "Event", with: @activity.event_id
    check "Is close" if @activity.is_close
    check "Is visible" if @activity.is_visible
    fill_in "Name", with: @activity.name
    fill_in "Rules", with: @activity.rules
    check "State" if @activity.state
    click_on "Update Activity"

    assert_text "Activity was successfully updated"
    click_on "Back"
  end

  test "destroying a Activity" do
    visit activities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Activity was successfully destroyed"
  end
end