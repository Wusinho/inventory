class CreateInventoryPurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :inventory_purchases, id: :uuid do |t|
      t.integer :stock_quantity, null: false
      t.float :purchase_price, null: false
      t.string :sold_out, default: false
      t.float :selling_price, null: false
      t.references :product, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
