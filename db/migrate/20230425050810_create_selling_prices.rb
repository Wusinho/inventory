class CreateSellingPrices < ActiveRecord::Migration[7.0]
  def change
    create_table :selling_prices, id: :uuid do |t|
      t.references :cost, null: false, foreign_key: true, type: :uuid
      t.decimal :price, null: false
      t.integer :quantity, null: false
      t.string :special_price

      t.timestamps
    end
  end
end


