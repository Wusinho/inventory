class ExpensesController < ApplicationController

  def create
    @expense = current_balance.expenses.build(spend_params)
    if @expense.save
      streams = []
      streams << turbo_stream.replace("balance_#{@expense.balance_id}", partial: 'balances/balance', locals: { balance: @expense.balance})
      streams << turbo_stream.replace('spend_form', partial: 'Expenses/form', locals: { expense: Expense.new })
      render turbo_stream: streams
    else
      turbo_error_message(@expense)
    end
  end

  private

  def spend_params
    params.require(:expense).permit(:payments, :details)

  end

end
