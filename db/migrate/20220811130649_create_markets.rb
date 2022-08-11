class CreateMarkets < ActiveRecord::Migration[7.0]
  def change
    create_table :markets do |t|
      t.integer :stock_id
      t.integer :amount
      t.integer :user_id, default: 0

      t.timestamps
    end
  end
end
