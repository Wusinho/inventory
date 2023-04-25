class CostsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_costs, only: [:edit, :update]

  def edit;end

  def update
    if @cost.update(costs_params)
      redirect_to products_path
      # render turbo_stream: turbo_stream.replace("selling_costs_#{@costs.id}", partial: 'selling_costs/sell_cost', locals: { provider: @costs })
    else
      turbo_error_message(@cost)
    end
    rescue StandardError => e
      active_record_error_message(e.message)
  end

  def set_costs
    @cost = Cost.find(params[:id])
  end

  def selling_costs_params
    params.require(:cost).permit(selling_prices_attributes: [:id, :cost, :quantity, :special_cost, :_destroy])
  end

  def costs_params
    params.require(:cost).permit(:product_id, :quantity, :price, :sold_out, selling_prices_attributes: [:cost_id, :price, :quantity, :special_price, :_destroy])
  end
end
