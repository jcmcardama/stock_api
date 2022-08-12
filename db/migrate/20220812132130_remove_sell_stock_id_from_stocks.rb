class RemoveSellStockIdFromStocks < ActiveRecord::Migration[7.0]
  def change
    remove_column :transactions, :sell_stock_id, :integer
  end
end
