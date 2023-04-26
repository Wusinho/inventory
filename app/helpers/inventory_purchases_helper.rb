module InventoryPurchasesHelper

  def stock_sold_out?(sold_out)
    css = 'card'
    css += ' border-warning' unless sold_out
    css
  end

end
