class RemoveRatingFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :rating
  end
end
