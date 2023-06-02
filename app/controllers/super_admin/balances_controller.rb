# frozen_string_literal: true

class SuperAdmin::BalancesController < ApplicationController
  before_action :authenticate_admin!

  include Crudatable
end
