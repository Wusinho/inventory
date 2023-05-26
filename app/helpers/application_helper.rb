module ApplicationHelper
  def resource_name
    :admin
  end

  def resource_class
    Admin
  end

  def resource
    @resource ||= Admin.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:admin]
  end

  def blue_btn
    'btns btn-primary'
  end

  def search_btn
    'btns search_btn'
  end

  def pink_btn
    'btns pink_btn'
  end

  def red_btn
    'btns btn-danger'
  end

  def f_label
    'form-label'
  end

  def f_control
    'form-control'
  end

  def form_label
    "form-label"
  end

  def form_control
    'form-control'
  end

  def format_date(date)
    date.strftime('%d/%m/%Y')
  end

  def active_nav?(providers_path)
    class_name = current_page?(providers_path) ? ' active' : ''
    "navbar-brand#{class_name}"

  end

  def invisible(provider)
    'd-none' unless provider.persisted?
  end

  def model_template(new_instance, model_query, filter = false)
    klass_name = new_instance.class.name.downcase
    id = klass_name.pluralize

    content_tag(:div, class: "#{klass_name}_container model_container") do
      concat(content_tag(:div, class: 'form', data: { controller: 'form' }) do
        concat(button_to("Add new #{klass_name}", '', data: { action: 'click->form#toggle_btn', form_target: 'btn' }, class: pink_btn ))
          concat(render("#{id}/form", "#{id.singularize}": new_instance))
      end)

      concat(content_tag(:div, id: 'filters', class: 'my-2') do
        concat(render('filters', category_list: model_query.products_cat))
      end) if filter.present?

      concat(content_tag(:div, id: id, class: 'model__display') do
        concat(render(model_query))
      end)
    end
  end

  def show_filter(controller_name)
    return unless %w[products customers].include?(controller_name)

    if controller_name == 'products'
      render 'shared/products_filter'
    else
      render 'shared/customers_filter'
    end

  end
end
