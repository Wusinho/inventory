class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices, id: :uuid do |t|
      t.references :product, null: false, foreign_key: true, type: :uuid
      t.float :price, null: false
      t.integer :quantity, null: false
      t.boolean :sold_out, default: false

      t.timestamps
    end
  end
end
