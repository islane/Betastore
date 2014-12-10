class ApplicationController < ActionController::Base
#   # Prevent CSRF attacks by raising an exception.
#   # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  add_flash_types :success, :error

	helper_method :current_cart
  
  
  def current_cart
    if session[:cart_id].blank?
      cart = Cart.create
      session[:cart_id] = cart.id
      @current_cart ||= Cart.find(session[:cart_id])
    else
      @current_cart ||= Cart.find(session[:cart_id])
    end
    rescue ActiveRecord::RecordNotFound
    reset_session
    redirect_to root_path, error: 'An error has occured with your cart, please try again'
  end

end

