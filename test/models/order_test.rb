require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "total amount is set when saving order" do
    order = Order.new(customer: customers(:ian))
    order.save
    #binding.pry
    order.line_items.create(
      product: products(:hat),
      quantity: 2)

      assert_equal 19.98, order.reload.total_amount.to_f
      order.errors.full_messages
    end
end
