require "application_system_test_case"

class ExtraPointsTest < ApplicationSystemTestCase
  setup do
    @extra_point = extra_points(:one)
  end

  test "visiting the index" do
    visit extra_points_url
    assert_selector "h1", text: "Extra Points"
  end

  test "creating a Extra point" do
    visit extra_points_url
    click_on "New Extra Point"

    fill_in "Amount", with: @extra_point.amount
    fill_in "Description", with: @extra_point.description
    fill_in "Event", with: @extra_point.event_id
    fill_in "Name", with: @extra_point.name
    click_on "Create Extra point"

    assert_text "Extra point was successfully created"
    click_on "Back"
  end

  test "updating a Extra point" do
    visit extra_points_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @extra_point.amount
    fill_in "Description", with: @extra_point.description
    fill_in "Event", with: @extra_point.event_id
    fill_in "Name", with: @extra_point.name
    click_on "Update Extra point"

    assert_text "Extra point was successfully updated"
    click_on "Back"
  end

  test "destroying a Extra point" do
    visit extra_points_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Extra point was successfully destroyed"
  end
end
