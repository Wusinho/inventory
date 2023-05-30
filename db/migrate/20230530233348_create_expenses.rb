class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses, id: :uuid do |t|
      t.references :balance, null: false, foreign_key: true, type: :uuid
      t.float :payments, null: false

      t.timestamps
    end
  end
end
