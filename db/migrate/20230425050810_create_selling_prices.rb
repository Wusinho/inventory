class CreateSellingPrices < ActiveRecord::Migration[7.0]
  def change
    create_table :selling_prices, id: :uuid do |t|
      t.references :price, null: false, foreign_key: true, type: :uuid
      t.float :price, null: false
      t.integer :quantity, null: false
      t.float :special_price

      t.timestamps
    end
  end
end
