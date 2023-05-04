class SellingOrdersController < ApplicationController
  before_action :set_selling_order, only: [:update]
  def update
    p '*'*100
    if @selling_order.update(selling_order_params)

      else

    end
    p '*'*100
  end

  private

  def set_selling_order
    @selling_order = SellingOrder.find(params[:id])
  end

  def selling_order_params
    params.require(:selling_order).permit(:paid)
  end

end
