class Customer < ApplicationRecord
  has_many :selling_orders
  def full_name
    last_name ? "#{name} #{last_name}" : first_name
  end

  def self.pending_unpaid_orders
    joins(:selling_orders)
      .where.not(selling_orders: { paid: true })
      .distinct
  end

  def self.paid_orders
    joins("LEFT OUTER JOIN selling_orders ON selling_orders.customer_id = customers.id")
      .group("customers.id")
      .having(
        "count(distinct case when selling_orders.paid = true then selling_orders.id end) = count(distinct selling_orders.id) OR count(selling_orders.id) = 0")
  end

  def unpaid_products
    selling_orders.where(paid: false).joins(:product).distinct.pluck(:name)
  end


end
