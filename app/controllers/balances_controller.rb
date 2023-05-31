class BalancesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @balances = Balance.list
    @spend = Spend.new
  end
end
