class AddQuantityToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :quantity, :float
  end
end
