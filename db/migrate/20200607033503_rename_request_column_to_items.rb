class RenameRequestColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :item_condition, :item_condition_id
    rename_column :items, :postage_payer, :postage_payer_id
    rename_column :items, :shipping_prefecture, :shipping_prefecture_id
    rename_column :items, :shipping_day, :shipping_day_id
  end
end
