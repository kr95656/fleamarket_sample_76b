class RenameUrlColumnToImages < ActiveRecord::Migration[5.2]
  def change
    rename_column :images, :url, :src
  end
end
