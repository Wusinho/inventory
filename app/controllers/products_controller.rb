class ProductsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_product, only: [:edit, :update, :show]
  def index
    @product = Product.new
    @product.costs.build
    @products = Product.all
  end

  def show
    @costs = @product.costs
  end

  def edit;end

  def update
    if @product.update(products_params)
      render turbo_stream: turbo_stream.replace("product_#{@product.id}", partial: 'products/product', locals: { product: @product })
    else
      turbo_error_message(@product)
    end
  end

  def create
    @product = Product.new(products_params)

    if @product.save
      @new_product =  Product.new
      @new_product.costs.build
      render turbo_stream: turbo_stream.replace('product_form', partial: 'products/form', locals: { product: @new_product })
    else
      turbo_error_message(@product)
    end

  end



  def set_product
    @product = Product.find(params[:id])
  end

  def products_params
    params.require(:product).permit(:name, :description, :provider_id, prices_attributes: [:price, :quantity])
  end
end
