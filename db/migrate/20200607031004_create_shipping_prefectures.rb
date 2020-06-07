class CreateShippingPrefectures < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_prefectures do |t|

      t.timestamps
    end
  end
end
