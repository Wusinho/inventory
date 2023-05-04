class SellingOrdersController < ApplicationController
  before_action :set_selling_order, only: [:update]
  def update
    if @selling_order.update(selling_order_params)
      streams = []
      streams << turbo_stream.remove("selling_order_#{@selling_order.id}")
      streams << turbo_stream.append('paid_selling_orders', partial: 'selling_orders/selling_order', locals: { selling_order: @selling_order })
      render turbo_stream: streams
    else
      turbo_error_message(@selling_order)
    end
  end

  private

  def set_selling_order
    @selling_order = SellingOrder.find(params[:id])
  end

  def selling_order_params
    params.require(:selling_order).permit(:paid)
  end

end
