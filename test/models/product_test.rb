require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "create a product" do
    product = Product.new(name:"Test", price:1.00)
    assert product.save, product.errors.full_messages
  end

  test "name is required" do
    product = Product.new()
    refute product.save, 'name is necessary'
    assert product.errors.full_messages.include?("Name can't be blank")
  end

  test "price must be a number" do
    product = Product.new()
    refute product.save, 'price must be a number'
    assert product.errors.full_messages.include?("Price is not a number")
  end

end
