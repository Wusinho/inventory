module ProductsHelper

  def nested_inventory_purchases(product, f)
    return if product.persisted?

    render 'inventory_purchases/form', f: f
  end
end
