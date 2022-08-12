class AddPriceToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :price, :float
  end
end
