class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :sell_stock_id
      t.integer :buy_stock_id
      t.integer :user_id
      t.integer :amount
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
