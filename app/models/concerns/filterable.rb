# frozen_string_literal: true
module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params, user = nil)
      results = where(nil)
      return results.order(created_at: :asc) if filtering_params.blank?

      value = filtering_params.values.first
      key = filtering_params.keys.first
      value.blank? ? results.public_send("filter_#{key}") : results.public_send("filter_#{key}", value)
    end
  end
end


