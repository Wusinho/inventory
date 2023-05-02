class CreateProductCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :product_categories, id: :uuid do |t|
      t.references :product, null: false, foreign_key: true, type: :uuid
      t.references :category, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
