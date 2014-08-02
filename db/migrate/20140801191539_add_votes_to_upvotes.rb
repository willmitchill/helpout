class AddVotesToUpvotes < ActiveRecord::Migration
  def change
    add_column :upvotes, :votes, :integer
  end
end
