class RemoveBuyStockIdFromStocks < ActiveRecord::Migration[7.0]
  def change
    remove_column :transactions, :buy_stock_id, :integer
  end
end
