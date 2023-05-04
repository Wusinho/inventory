class Customer < ApplicationRecord
  has_many :selling_orders

  def full_name
    last_name ? "#{name} #{last_name}" : first_name
  end

end
