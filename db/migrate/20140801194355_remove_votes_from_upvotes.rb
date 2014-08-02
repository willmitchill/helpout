class RemoveVotesFromUpvotes < ActiveRecord::Migration
  def change
    remove_column :upvotes, :votes, :integer
  end
end
