class RemoveUserIdFromStocks < ActiveRecord::Migration[7.0]
  def change
    remove_column :stocks, :user_id, :integer
  end
end
