# frozen_string_literal: true

class SuperAdmin::BalancesController < ApplicationController
  before_action :authenticate_admin!

  include Crudatable

  def resource_params
    params.require(:balance).permit(:starting_total, :sub_total, :last_day)
  end
end
