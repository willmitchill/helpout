class AddProjectIdToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :project_id, :integer
  end
end
