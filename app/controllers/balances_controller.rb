class BalancesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @balances = Balance.list.includes([:expenses])
    @expense = Expense.new
  end
end
