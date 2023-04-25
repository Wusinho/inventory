module ProductsHelper

  def add_nested_price(product, f)
    return if product.persisted?

    render 'costs/form', f: f
  end
end
