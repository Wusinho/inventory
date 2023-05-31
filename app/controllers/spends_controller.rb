class SpendsController < ApplicationController

  def create
    @spend = current_balance.spends.build(spend_params)
    if @spend.save
      streams = []
      streams << turbo_stream.replace("balance_#{@spend.balance_id}", partial: 'balances/balance', locals: { balance: @spend.balance})
      streams << turbo_stream.replace('spend_form', partial: 'spends/form', locals: { spend: Spend.new })
      render turbo_stream: streams
    else
      turbo_error_message(@spend)
    end
  end

  private

  def spend_params
    params.require(:spend).permit(:payments, :details)

  end

end
