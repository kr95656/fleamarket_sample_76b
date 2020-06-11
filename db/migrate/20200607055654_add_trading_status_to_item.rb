class AddTradingStatusToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :trading_status, :string, null: false
  end
end
