class Admin::ProductsController < Admin::BaseController

  def index
      @products = Product.order('name')
  end

  def show
    # binding.pry
    @id = params[:id]
    @product_info = Product.find(@id)
  end

  def new
    @product = Product.new
  end

  def edit
    @id = params[:id]
    @product_info = Product.find(@id)
  end

  def update
    @id = params[:id]
    @product = Product.find(@id)
    if @product.update(product_params)
      redirect_to admin_products_path, notice: "Product #{@product.id} (#{@product.name}) was updated"
    else
      render 'edit'
    end
  end

  def destroy
    @id = params[:id]
    @product = Product.find(@id)
    if @product.destroy
      redirect_to admin_products_path, notice: "Product #{@product.id} was deleted"
    else
      render 'edit'
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: "Product #{@product.id} was created"
    else
      render 'new'
    end
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

  private
  def product_params
    params.require(:product).permit(:name, :price, :image_url)
  end

end
