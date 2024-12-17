require "application_system_test_case"

class StocktakesTest < ApplicationSystemTestCase
  setup do
    @stocktake = stocktakes(:one)
  end

  test "visiting the index" do
    visit stocktakes_url
    assert_selector "h1", text: "Stocktakes"
  end

  test "should create stocktake" do
    visit stocktakes_url
    click_on "New stocktake"

    fill_in "Date", with: @stocktake.date
    click_on "Create Stocktake"

    assert_text "Stocktake was successfully created"
    click_on "Back"
  end

  test "should update Stocktake" do
    visit stocktake_url(@stocktake)
    click_on "Edit this stocktake", match: :first

    fill_in "Date", with: @stocktake.date
    click_on "Update Stocktake"

    assert_text "Stocktake was successfully updated"
    click_on "Back"
  end

  test "should destroy Stocktake" do
    visit stocktake_url(@stocktake)
    click_on "Destroy this stocktake", match: :first

    assert_text "Stocktake was successfully destroyed"
  end
end
