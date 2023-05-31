class BalancesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @balances = Balance.all
    @spend = Spend.new
  end
end
