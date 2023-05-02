class ProductsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_product, only: [:edit, :update, :show, :new]

  def index
    @product = Product.new
    @product.inventory_purchases.build
    @products = Product.all
  end

  def new
    @inventory_purchase = @product.inventory_purchases.build
  end

  def show
    @inventory_purchases = @product.inventory_purchases
  end

  def edit;end

  def update
    if @product.update(products_params)
      render turbo_stream: turbo_stream.replace("product_#{@product.id}", partial: 'products/simple_product', locals: { product: @product })
    else
      turbo_error_message(@product)
    end
  end

  def create
    @product = Product.new(products_params.merge(product_categories_params(params)))
    if @product.save
      create_new_product
      streams = []
      streams << turbo_stream.replace('product_form', partial: 'products/form', locals: { product: @new_product })
      streams << turbo_stream.prepend('products', partial: 'products/product', locals: { product: @product })
      render turbo_stream: streams
    else
      turbo_error_message(@product)
    end
  end

  private

  def create_new_product
    @new_product =  Product.new
    @new_product.inventory_purchases.build
  end

  def product_categories_params(params)
    category_ids = params[:product][:product_categories_attributes].reject(&:blank?)
    product_categories_params = category_ids.map { |id| { category_id: id } }
    { product_categories_attributes: product_categories_params }
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def products_params
    params.require(:product).permit(:name, :description, :provider_id,
                                    inventory_purchases_attributes: [:purchase_price, :stock_quantity, :selling_price],
                                    product_categories_attributes: [:category_id]
                                    )

  end
end
