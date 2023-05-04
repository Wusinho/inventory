module SellingOrdersHelper
  def paid_update_link(f)
    return if f.object.paid

    link_to 'Paid', '', data: {
      controller: "update-customer-payment",
      action: "update-customer-payment#click",
      id: f.object.id
    }, class: green_btn
  end

  def payment_status(f)
    css = 'card'
    css += ' border-danger' unless f.object.paid
    css

  end

end
