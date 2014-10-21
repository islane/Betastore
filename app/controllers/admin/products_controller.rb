class Admin::ProductsController < ApplicationController
  def index
    @products = Product.order('name')
  end

  def show
    # binding.pry
    @id = params[:id]

    @product_info = Product.find(@id)

  end

end
