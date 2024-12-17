require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "product is invalid without a name" do
    product = Product.new(unit: 10)
    assert_not product.valid?, "Product is valid without a name"
    assert_includes product.errors[:name], "can't be blank"
  end

  test "product is valid with name and unit" do
    section = sections(:one) # Load the 'one' section fixture
    product = Product.new(name: "Gin", unit: 10, section: section)
    assert product.valid?, "Product should be valid with name, unit, and section"
  end
end