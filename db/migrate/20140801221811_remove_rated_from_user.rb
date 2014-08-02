class RemoveRatedFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :rated
  end
end
