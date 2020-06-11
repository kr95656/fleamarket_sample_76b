class ChangeLimitOfInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :shipping_destinations, :phone_number, :integer, unique: true, limit: 8
  end
end
