# app/models/concerns/editable.rb
module Editable
  extend ActiveSupport::Concern

  class_methods do
    def sa_column_names(default_times = [])
      if default_times.blank?
        column_names - %w[created_at updated_at]
      else
        column_names - default_times
      end
    end
  end

end
