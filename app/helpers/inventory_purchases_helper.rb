module InventoryPurchasesHelper

  def stock_sold_out?(sold_out)
    css = 'card'
    css += ' with_stock' unless sold_out
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

  def color_options
    [
      %w[Rojo rojo],
      %w[Azul azul],
      %w[Verde verde],
      %w[Amarillo amarillo],
      %w[Naranja naranja],
      %w[Morado morado],
      %w[Celeste celeste],
      %w[Rosado rosado],
      %w[Fucsia fucsia],
      %w[Turquesa turquesa],
    ]
  end

  def colors_select(f)
    options = { multiple: true, class: 'form-select', id: 'validationTagsThreshold', data: { controller: 'tag-select', allow_clear: true, suggestions_threshold: 0 } }
    select = { include_blank: true }

    f.collection_select(:colors, color_options, :last, :first, select, options)
  end




end
