class RemoveRatedAndProjectIdFromRatings < ActiveRecord::Migration
  def change
    remove_column :ratings, :project_id
    remove_column :ratings, :rated
  end
end
