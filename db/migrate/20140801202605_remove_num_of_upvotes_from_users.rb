class RemoveNumOfUpvotesFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :num_of_upvotes
  end
end
