module ProductsHelper

  def nested_inventory_purchases(product, f)
    return if product.persisted?

    render 'inventory_purchases/form', f: f
  end

    def product_categories_select(product, f)
      options = { multiple: true, class: 'form-select', id: 'validationTagsThreshold', data: { controller: 'tag-select', allow_clear: true, suggestions_threshold: 0 } }
      select = { include_blank: true }

      select[:selected] = product.category_ids if product.persisted?
      f.collection_select(:product_categories_attributes, product.all_categories, :id, :name, select, options)

    end

end
