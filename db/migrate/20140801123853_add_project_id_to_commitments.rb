class AddProjectIdToCommitments < ActiveRecord::Migration
  def change
    add_column :commitments, :project_id, :integer
  end
end
