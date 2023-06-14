module BalancesHelper

  def render_table_rows(resources, resource)
    content_tag(:table, class: "table") do
      concat render_table_header(resources.sa_column_names)
      concat render_table_body(resources, partial_name(resource))
    end
  end

  private

  def render_table_header(column_names)
    content_tag(:thead) do
      content_tag(:tr) do
        column_names.each do |column_name|
          concat content_tag(:th, column_name, scope: "col")
        end
      end
    end
  end

  def render_table_body(resources, partial_name)
    content_tag(:tbody) do
      resources.each do |resource|
        concat render partial: partial_name, locals: { resource_key(resource) => resource }
      end
    end
  end


  def resource_key(resource)
    resource.class.name.underscore.to_sym
  end

  def partial_name(resource)
    resource_plural = resource.pluralize
    "super_admin/#{resource_plural}/#{resource}"
  end

end
