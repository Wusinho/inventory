module ProductsHelper
  def provider_select_field(current_admin)
    content_tag :div, class: 'pt-4' do
      concat label_tag(:provider_id, 'provider', class: "text-xs font-semibold px-1")
      concat select_tag('product[provider_id]', options_for_select(current_admin.providers_select), class: '')
    end
  end
end
