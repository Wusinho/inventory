# frozen_string_literal: true
module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params, user = nil)
      results = where(nil)
      results = results.where(user:) if method_defined?(:user) && user
      return results.order(created_at: :asc) if filtering_params.blank?

      value = filtering_params.values.first
      key = filtering_params.keys.first
      results.public_send("filter_#{key}", value) if value.present?
    end
  end
end


