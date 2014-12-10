class Cart < ActiveRecord::Base
  belongs_to :customer
  has_many :cart_products
  
  def item_count
  	cart_products.map(&:quantity).sum
  end

  def subtotal
  	cart_products.map(&:price).sum
  end
  
  def total
  	#TODO assess sales tax
  	subtotal
  end
end
