class RenameImgToFile < ActiveRecord::Migration
  def change
      rename_column :users, :img, :file
    end
end
