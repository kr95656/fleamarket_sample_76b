class CreatePostagePayers < ActiveRecord::Migration[5.2]
  def change
    create_table :postage_payers do |t|

      t.timestamps
    end
  end
end
