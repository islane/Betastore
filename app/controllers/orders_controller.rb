class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
  	if current_cart.cart_products.count >= 1
	    order = Order.create(order_params)
	    if order.save 
	    
		    current_cart.cart_products.each do |cart_product|
		      line_item = order.line_items.build(
		        product_id:  cart_product.product_id,
		        name:        cart_product.product.name,
		        price:       cart_product.product.price,
		        quantity:    cart_product.quantity,
		      )
		      line_item.save!
		    end
			 
		    session[:cart_id] = nil
		
		    redirect_to order,
		    notice: "Order Created"
		else
			redirect_to new_order_path,
			notice: 'Please enter a valid email address to proceed with checkout.'
		end
	 else
	 	redirect_to cart_path, notice: "Your cart is empty!"
	 end
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:email).merge(cart_id: current_cart.id, stripe_token: params[:stripeToken], cart_total: current_cart.total.to_f)
  end

end