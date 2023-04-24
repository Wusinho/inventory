class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products, id: :uuid do |t|
      t.references :provider, null: false, foreign_key: true, type: :uuid
      t.string :name, null: false
      t.string :description


      t.timestamps
    end
  end
end
