# app/models/concerns/editable.rb
module Editable
  extend ActiveSupport::Concern

  class_methods do
    def sa_column_names(default_times = [])
      col_names = if default_times.blank?
                    column_names - %w[created_at updated_at]
                  else
                    column_names - default_times
                  end
      col_names << 'edit'
    end
  end

end
