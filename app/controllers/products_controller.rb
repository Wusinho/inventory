class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update]
  def index
    @product = Product.new
    @products = Product.all
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
      streams = []
      streams << turbo_stream.append('products', partial: 'products/product', locals: { product: @product })
      streams << turbo_stream.replace('product_form', partial: 'products/form', locals: { product: Product.new })
      render turbo_stream: streams
    else
      turbo_error_message(@product)
    end

  end



  def set_product
    @product = Product.find(params[:id])
  end

  def products_params
    params.require(:product).permit(:name, :description, :provider_id)
  end
end
