module SellingOrdersHelper
  def paid_update_button(selling_order)
    return if selling_order.paid

    button_to 'Paid', selling_order_path({id: selling_order.id, paid: true}), method: :put, class: pink_btn
  end

  def payment_status(f)
    css = 'card user_order'
    return css if f.object.paid

    css.then { |text| text += ' with_stock'}
  end

    def order_button_if_stock_left(inventory_purchase)
      return unless inventory_purchase.stock_left?

      content_tag(:button, "Orden", class: "btn btn-primary", "data-action": "nested-form#add", type: "button")
    end

  def display_sizes(inventory_purchase)
    return unless inventory_purchase.size

    content_tag(:div, class: "form-group mb-2") do
      content_tag(:div, "talla: #{inventory_purchase.size}")
    end

  end

  def display_colors(inventory_purchase)
    return if inventory_purchase.colors.empty?

    content_tag(:div, class: "form-group mb-2") do
      content_tag(:p, "colores: #{inventory_purchase.colors.to_sentence}")
    end

  end

end
