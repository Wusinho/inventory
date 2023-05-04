class SellingOrdersController < ApplicationController
  before_action :set_selling_order, only: [:update]
  def update
    if @selling_order.update(paid: params[:paid])
      render json: {
        paid: true
      }
    else

    end
  end

  private

  def set_selling_order
    @selling_order = SellingOrder.find(params[:id])
  end

  def selling_order_params
    params.permit(:paid)
  end

end
