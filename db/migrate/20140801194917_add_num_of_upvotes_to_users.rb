class AddNumOfUpvotesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :num_of_upvotes, :integer
  end
end
