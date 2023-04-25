module ProductsHelper

  def add_nested_price(product, f)
    return if product.persisted?

    render 'prices/form', f: f
  end
end
