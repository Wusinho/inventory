class CreateSpends < ActiveRecord::Migration[7.0]
  def change
    create_table :spends, id: :uuid do |t|
      t.references :balance, null: false, foreign_key: true, type: :uuid
      t.float :payments, null: false
      t.string :details, null: false

      t.timestamps
    end
  end
end
