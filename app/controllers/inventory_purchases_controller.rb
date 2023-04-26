class InventoryPurchasesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_inventory_purchases, only: [:edit, :update]

  def edit;end

  def update
    if @inventory_purchase.update(inventory_purchases_params)
      redirect_to product_path(@inventory_purchase.product_id)
    else
      turbo_error_message(@inventory_purchase)
    end
  rescue StandardError => e
    active_record_error_message(e.message)
  end

  def set_inventory_purchases
    @inventory_purchase = InventoryPurchase.find(params[:id])
  end

  # def selling_inventory_purchases_params
  #   params.require(:cost).permit(selling_prices_attributes: [:id, :cost, :quantity, :special_cost, :_destroy])
  # end

  def inventory_purchases_params
    params.require(:inventory_purchase).permit(:product_id, :stock_quantity, :purchase_price, :sold_out, selling_prices_attributes: [:id, :price, :quantity, :special_price, :_destroy])
  end
end
