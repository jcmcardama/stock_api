class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :money, :integer, default: 20000
    add_column :users, :status, :boolean, default: true
  end
end
