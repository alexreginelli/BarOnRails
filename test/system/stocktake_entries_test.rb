require "application_system_test_case"

class StocktakeEntriesTest < ApplicationSystemTestCase
  setup do
    @stocktake_entry = stocktake_entries(:one)
  end

  test "visiting the index" do
    visit stocktake_entries_url
    assert_selector "h1", text: "Stocktake entries"
  end

  test "should create stocktake entry" do
    visit stocktake_entries_url
    click_on "New stocktake entry"

    fill_in "Product", with: @stocktake_entry.product_id
    fill_in "Quantity", with: @stocktake_entry.quantity
    fill_in "Stocktake", with: @stocktake_entry.stocktake_id
    click_on "Create Stocktake entry"

    assert_text "Stocktake entry was successfully created"
    click_on "Back"
  end

  test "should update Stocktake entry" do
    visit stocktake_entry_url(@stocktake_entry)
    click_on "Edit this stocktake entry", match: :first

    fill_in "Product", with: @stocktake_entry.product_id
    fill_in "Quantity", with: @stocktake_entry.quantity
    fill_in "Stocktake", with: @stocktake_entry.stocktake_id
    click_on "Update Stocktake entry"

    assert_text "Stocktake entry was successfully updated"
    click_on "Back"
  end

  test "should destroy Stocktake entry" do
    visit stocktake_entry_url(@stocktake_entry)
    click_on "Destroy this stocktake entry", match: :first

    assert_text "Stocktake entry was successfully destroyed"
  end
end
