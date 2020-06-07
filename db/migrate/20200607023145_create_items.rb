class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :name, null: false
      t.text :introduction, null: false
      t.references :category, null: false, foreign_key: true
      t.string :brand
      t.string :item_condition, null: false
      t.string :postage_payer, null: false
      t.string :shipping_prefecture, null: false
      t.string :shipping_day, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end