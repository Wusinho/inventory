class CreateCosts < ActiveRecord::Migration[7.0]
  def change
    create_table :costs, id: :uuid do |t|
      t.integer :quantity, null: false
      t.float :price, null: false
      t.float :selling_price, null: false
      t.boolean :sold_out, default: false
      t.references :product, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
