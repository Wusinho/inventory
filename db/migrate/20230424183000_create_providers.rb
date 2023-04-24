class CreateProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :providers, id: :uuid do |t|
      t.string :name, null: false
      t.string :address
      t.string :contact
      t.string :phone, null: false
      t.string :bank_number

      t.timestamps
    end
  end
end
