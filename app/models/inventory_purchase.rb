class InventoryPurchase < ApplicationRecord
  belongs_to :product
  has_many :selling_orders
  validates_presence_of :stock_quantity, :purchase_price, :selling_price
  validates :purchase_price, numericality: { greater_than: 1 }
  validates :selling_price, numericality: { greater_than: 1 }
  accepts_nested_attributes_for :selling_orders, reject_if: :all_blank, allow_destroy: true
  before_create :eliminate_blank_colors
  before_create :round_nums
  after_create_commit :create_expense
  enum size: [:S, :M, :L, :XL, :XLL ]

  def create_expense
    Expense.create(payments: (stock_quantity * purchase_price), details: "Compra: #{product.name}", balance: last_balance)
  end

  def eliminate_blank_colors
    self.colors = self.colors.reject(&:empty?)
  end

  def stock_left?
    self.stock_quantity.positive?
  end

  def round_nums
    self.purchase_price = self.purchase_price.round(2)
    self.selling_price = self.selling_price.round(2)
  end

  def last_balance
    Balance.last_created
  end

  def last_balance_id
    last_balance&.id
  end

  def last_selling_orders
    selling_orders.order(created_at: :desc).first
  end

end
