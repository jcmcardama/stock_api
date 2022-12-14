class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.string :name
      t.integer :amount
      t.integer :transaction_id
      t.integer :user_id, default: 0

      t.timestamps
    end
  end
end
