class OrderWorker
	include Sidekiq::Worker
	
	def perform(order_id, stripe_token, cart_total)
		order = Order.find_by(id: order_id)
		if order
		  charge = Stripe::Charge.create(
	      :amount      => (cart_total * 100).round,
	      # :customer    => order.email,
	      :description => order.email,
	      :currency    => 'usd',
	      :card 	   => stripe_token
	      )

	      Rails.logger.info "Processing order #{order.id}"
	      # send a success email
		else
		  Rails.logger.error "Could not find order with ID=#{order_id}"
		  # send a failure email
		end	
	end
end
	