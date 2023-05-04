class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers, id: :uuid do |t|
      t.string :name, null: false
      t.string :last_name
      t.string :phone, null: false

      t.timestamps
    end
  end
end
