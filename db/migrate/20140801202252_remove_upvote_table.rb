class RemoveUpvoteTable < ActiveRecord::Migration
  def change
    drop_table :upvotes
  end
end
