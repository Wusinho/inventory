class Customer < ApplicationRecord
  include Filterable
  has_many :selling_orders
  scope :products_cat, -> { Customer.pluck(:id, :name)  }
  scope :filter_sort_by_name, ->(value) { order("#{value} ASC") }
  scope :filter_search, ->(value) { where( "name ILIKE :search", search: "%#{value.downcase}%") }
  scope :filter_users, ->(value) { where(id: value) }

  def full_name
    last_name ? "#{name} #{last_name}" : first_name
  end

  def total_debt
    num = selling_orders.where(paid: false).map { |order| order.price * order.quantity}.reduce(&:+) || 0
    num.round(2)
  end

  def self.filter_unpaid_orders
    joins(:selling_orders)
      .where.not(selling_orders: { paid: true })
      .distinct
  end

  def self.filter_paid_orders
    joins("LEFT OUTER JOIN selling_orders ON selling_orders.customer_id = customers.id")
      .group("customers.id")
      .having(
        "count(distinct case when selling_orders.paid = true then selling_orders.id end) = count(distinct selling_orders.id) OR count(selling_orders.id) = 0")
  end

  def self.filter_none
    Customer.all
  end

  def unpaid_products
    selling_orders.where(paid: false).joins(:product).distinct.pluck(:name)
  end


end
