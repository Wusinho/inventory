class CustomersController < ApplicationController
  before_action :set_customer, only: [:update, :edit, :show]

  def index
    @customer = Customer.new
    @customers_unpaid_orders = Customer.pending_unpaid_orders
    @customers = Customer.paid_orders
  end

  def show
    @selling_orders = @customer.selling_orders.where(paid: true)
    @unpaid_selling_orders = @customer.selling_orders.where(paid: false)
  end

  def update
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      streams = []
      streams << turbo_stream.replace('product_form', partial: 'customers/form', locals: { customer: Customer.new })
      streams << turbo_stream.prepend('customers', partial: 'customers/customer', locals: { customer: @customer })
      render turbo_stream: streams
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
