class CreateBalances < ActiveRecord::Migration[7.0]
  def change
    create_table :balances, id: :uuid do |t|
      t.float :starting_total, null: false
      t.float :sub_total, null: false
      t.date :last_day

      t.timestamps
    end
  end
end
