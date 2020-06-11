class CreateShippingDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_destinations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :destination_first_name, null: false
      t.string :destination_last_name, null: false
      t.string :destination_first_name_kana, null: false
      t.string :destination_last_name_kana, null: false
      t.integer :post_code, null: false
      t.integer :prefecture_code, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building
      t.integer :phone_number, unique:true
      t.timestamps
    end
  end
end
