class AddRatingToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :rating, :integer, :default => 0
  end
end
