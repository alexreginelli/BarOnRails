require "test_helper"

class StocktakesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stocktake = stocktakes(:one)
  end

  test "should get index" do
    get stocktakes_url
    assert_response :success
  end

  test "should get new" do
    get new_stocktake_url
    assert_response :success
  end

  test "should create stocktake" do
    assert_difference("Stocktake.count") do
      post stocktakes_url, params: { stocktake: { date: @stocktake.date } }
    end

    assert_redirected_to stocktake_url(Stocktake.last)
  end

  test "should show stocktake" do
    get stocktake_url(@stocktake)
    assert_response :success
  end

  test "should get edit" do
    get edit_stocktake_url(@stocktake)
    assert_response :success
  end

  test "should update stocktake" do
    patch stocktake_url(@stocktake), params: { stocktake: { date: @stocktake.date } }
    assert_redirected_to stocktake_url(@stocktake)
  end

  test "should destroy stocktake" do
    assert_difference("Stocktake.count", -1) do
      delete stocktake_url(@stocktake)
    end

    assert_redirected_to stocktakes_url
  end
end
