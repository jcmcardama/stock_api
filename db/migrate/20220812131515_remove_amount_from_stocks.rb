class RemoveAmountFromStocks < ActiveRecord::Migration[7.0]
  def change
    remove_column :stocks, :amount, :integer
  end
end
