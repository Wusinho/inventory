module InventoryPurchasesHelper

  def stock_sold_out?(sold_out)
    css = 'card'
    css += ' border-warning' unless sold_out
    css
  end

  def price_field(f, f_parent)
    if !f.object.special_price
      f.hidden_field :price, value: f_parent.object.selling_price
    else
      content_tag :div, class: 'form-group mb-2' do
        concat f.label :price
        concat f.number_field :price, value: f_parent.object.selling_price, class: 'form-control'
      end
    end
  end


end
