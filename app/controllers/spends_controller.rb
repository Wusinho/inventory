class SpendsController < ApplicationController

  def create
    @spend = current_balance.spends.build(spend_params)
    if @spend.save

    else
      turbo_error_message(@spend)

    end
  end

  private

  def spend_params
    params.require(:spend).permit(:payments)

  end

end
