class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update]
  def index
    @product = Product.new
    @products = Product.all
  end

  def edit;end

  def update
    if @product.update(products_params)
      redirect_to products_path
    end
  end

  def create
    @product = Product.new(products_params)

    if @product.save

    end

  end



  def set_product
    @product = Product.find(params[:id])
  end

  def products_params
    params.require(:product).permit(:name, :description, :provider_id)
  end
end
