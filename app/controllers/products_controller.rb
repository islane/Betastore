class ProductsController < ApplicationController
  include ApplicationHelper

  def index
    @products = Product.order('name').all
  end

  def show
    # binding.pry
    @id = params[:id]
    @product_info = Product.find(@id)
  end

  def vote_up
    product = Product.find(params[:id])
    product.increment(:votes)
    product.save
    render body: product.votes
  end

  def vote_down
    product = Product.find(params[:id])
    product.decrement(:votes)
    product.save
    render body: product.votes
  end

  def add_to_cart
    # cart = Cart.find_or_create_by(id: session[:cart_id])
    # session[:cart_id] = cart.id

    if session[:cart_id].blank?
      cart = Cart.create
      session[:cart_id] = cart.id
    else
      cart = Cart.find(session[:cart_id])
    end

    product = Product.find(params[:id])
    
    if cart.cart_products.find_by(product_id: params[:id]).present?
    	cart_item = cart.cart_products.find_by(product_id: params[:id])
	    cart_item.increment(:quantity)
    	cart_item.save
    	redirect_to products_path, notice: 'Updated item quantity'
    else 
      cart_item = cart.cart_products.build(product: product)
      cart_item.save
      redirect_to products_path, notice: 'Added new item to cart'
    end    
  end

  def remove_from_cart    
    cart_product = current_cart.cart_products.find {|cp| cp.id == params[:id].try(:to_i) }

    if cart_product.present?
      cart_product.destroy!
      redirect_to cart_path
    else
      raise ActiveRecord::RecordNotFound
    end
  end

end
