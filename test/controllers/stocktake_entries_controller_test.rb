require "test_helper"

class StocktakeEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @section = Section.create!(name: "Section 1")
    @product = Product.create!(name: "Product 1", unit: "Litre", section: @section)
    @stocktake = Stocktake.create!(date: "2024-12-17")
    @stocktake_entry = StocktakeEntry.create!(stocktake: @stocktake, product: @product, quantity: 5.0)
  end

  test "should get index" do
    get stocktake_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_stocktake_entry_url
    assert_response :success
  end

  test "should create stocktake entry" do
    assert_difference('StocktakeEntry.count', 1) do
      post stocktake_entries_url, params: {
        stocktake_id: @stocktake.id,  # Send the stocktake_id directly
        stocktake: {                  # Send product_id and quantity as a hash
          @product.id => 10.0         # product_id => quantity
        }
      }
    end
    assert_redirected_to stocktake_path(@stocktake)
  end
  
  test "should show stocktake entry" do
    get stocktake_entry_url(@stocktake_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_stocktake_entry_url(@stocktake_entry)
    assert_response :success
  end

  test "should update stocktake entry" do
    patch stocktake_entry_url(@stocktake_entry), params: { stocktake_entry: { quantity: 10.0 } }
    assert_redirected_to stocktake_entry_url(@stocktake_entry)
  end

  test "should destroy stocktake entry" do
    assert_difference('StocktakeEntry.count', -1) do
      delete stocktake_entry_url(@stocktake_entry)
    end
    assert_redirected_to stocktake_entries_url
  end
end
