class CustomersController < ApplicationController
  before_action :set_customer, only: [:update, :edit, :show]

  def index
    @customer = Customer.new
    @customers_unpaid_orders = Customer.pending_unpaid_orders
    @customers = Customer.paid_orders
  end

  def show
    @selling_orders = @customer.selling_orders
  end

  def update
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save

      else

    end

  end


  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name,:last_name, :phone)
  end


end
