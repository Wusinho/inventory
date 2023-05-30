class BalancesController < ApplicationController
  def index
    @balances = Balance.all
  end
end
