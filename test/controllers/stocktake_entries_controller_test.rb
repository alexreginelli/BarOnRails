require "test_helper"

class StocktakeEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stocktake_entry = stocktake_entries(:one)
  end

  test "should get index" do
    get stocktake_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_stocktake_entry_url
    assert_response :success
  end

  test "should create stocktake_entry" do
    assert_difference("StocktakeEntry.count") do
      post stocktake_entries_url, params: { stocktake_entry: { product_id: @stocktake_entry.product_id, quantity: @stocktake_entry.quantity, stocktake_id: @stocktake_entry.stocktake_id } }
    end

    assert_redirected_to stocktake_entry_url(StocktakeEntry.last)
  end

  test "should show stocktake_entry" do
    get stocktake_entry_url(@stocktake_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_stocktake_entry_url(@stocktake_entry)
    assert_response :success
  end

  test "should update stocktake_entry" do
    patch stocktake_entry_url(@stocktake_entry), params: { stocktake_entry: { product_id: @stocktake_entry.product_id, quantity: @stocktake_entry.quantity, stocktake_id: @stocktake_entry.stocktake_id } }
    assert_redirected_to stocktake_entry_url(@stocktake_entry)
  end

  test "should destroy stocktake_entry" do
    assert_difference("StocktakeEntry.count", -1) do
      delete stocktake_entry_url(@stocktake_entry)
    end

    assert_redirected_to stocktake_entries_url
  end
end
