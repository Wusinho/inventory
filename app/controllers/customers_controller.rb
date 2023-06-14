class CustomersController < ApplicationController
  before_action :authenticate_admin!
  before_action :selected_params, only: [:index]
  before_action :set_customer, only: [:update, :edit, :show]

  def index
    @customer = Customer.new
    @customers = Customer.filter(@selected_params)
  end

  def show
    @selling_orders = @customer.paid_orders_list
    @unpaid_selling_orders = @customer.unpaid_orders_list
  end

  def update
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
        streams = []
        streams << turbo_stream.replace('customer_form', partial: 'customers/form', locals: { customer: Customer.new })
        streams << turbo_stream.prepend('customers', partial: 'customers/customer', locals: { customer: @customer })
        render turbo_stream: streams
      else
        turbo_error_message(@product)
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
