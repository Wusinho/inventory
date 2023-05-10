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
    'btn btn-primary'
  end

  def green_btn
    'btn btn-success'
  end

  def red_btn
    'btn btn-danger'
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

end
