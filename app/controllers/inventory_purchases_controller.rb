class InventoryPurchasesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_inventory_purchases, only: [:edit, :update]

  def edit;end

  def create
    @inventory_purchase = InventoryPurchase.new(inventory_purchases_params)
    if @inventory_purchase.save
      streams = []
      streams <<  turbo_stream.prepend("inventory_purchases", partial: 'inventory_purchases/inventory_purchase', locals: { inventory_purchase: @inventory_purchase })
      streams <<  turbo_stream.replace("new_purchase", partial: 'products/new_purchase', locals: { product: @inventory_purchase.product })
      render turbo_stream: streams
    else
      turbo_error_message(@inventory_purchase)
    end
  end

  def update
    if @inventory_purchase.update(inventory_purchases_params)
      redirect_to product_path(@inventory_purchase.product_id)
    else
      turbo_error_message(@inventory_purchase)
    end
  rescue StandardError => e
    active_record_error_message(e.message)
  end

  private

  def set_inventory_purchases
    @inventory_purchase = InventoryPurchase.find(params[:id])
  end

  def inventory_purchases_params
    params.require(:inventory_purchase).permit(:product_id, :stock_quantity, :purchase_price, :sold_out, :selling_price)
  end
end
