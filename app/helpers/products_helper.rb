module ProductsHelper

  def add_nested_price(product, f)
    return if product.persisted?

    render 'inventory_purchases/form', f: f
  end
end
