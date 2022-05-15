require "application_system_test_case"

class GroupSanctionsTest < ApplicationSystemTestCase
  setup do
    @group_sanction = group_sanctions(:one)
  end

  test "visiting the index" do
    visit group_sanctions_url
    assert_selector "h1", text: "Group Sanctions"
  end

  test "creating a Group sanction" do
    visit group_sanctions_url
    click_on "New Group Sanction"

    fill_in "Amount", with: @group_sanction.amount
    fill_in "Date done", with: @group_sanction.date_done
    fill_in "Group", with: @group_sanction.group_id
    fill_in "Sanction", with: @group_sanction.sanction_id
    fill_in "User", with: @group_sanction.user_id
    click_on "Create Group sanction"

    assert_text "Group sanction was successfully created"
    click_on "Back"
  end

  test "updating a Group sanction" do
    visit group_sanctions_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @group_sanction.amount
    fill_in "Date done", with: @group_sanction.date_done
    fill_in "Group", with: @group_sanction.group_id
    fill_in "Sanction", with: @group_sanction.sanction_id
    fill_in "User", with: @group_sanction.user_id
    click_on "Update Group sanction"

    assert_text "Group sanction was successfully updated"
    click_on "Back"
  end

  test "destroying a Group sanction" do
    visit group_sanctions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Group sanction was successfully destroyed"
  end
end
