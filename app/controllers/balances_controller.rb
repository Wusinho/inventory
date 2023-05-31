class BalancesController < ApplicationController
  def index
    @balances = Balance.all
    @spend = Spend.new
  end
end
