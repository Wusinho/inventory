module SellingOrdersHelper
  def paid_update_button(selling_order)
    return if selling_order.paid

    button_to 'Paid', selling_order_path({id: selling_order.id, paid: true}), method: :put, class: green_btn
  end

  def payment_status(f)
    css = 'card'
    css += ' border-danger' unless f.object.paid
    css

  end

end
