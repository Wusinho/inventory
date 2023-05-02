class CreateSellingOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :selling_orders, id: :uuid do |t|
      t.references :inventory_purchase, null: false, foreign_key: true, type: :uuid
      t.float :price, null: false
      t.integer :quantity, null: false
      t.boolean :special_price, default: false

      t.timestamps
    end
  end
end
