class RemoveTransactionIdFromStocks < ActiveRecord::Migration[7.0]
  def change
    remove_column :stocks, :transaction_id, :integer
  end
end
