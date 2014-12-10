class Admin::OrdersController < Admin::BaseController
  
  def index
  	@orders = Order.order('id').all
  	@line_items
  end
  
end