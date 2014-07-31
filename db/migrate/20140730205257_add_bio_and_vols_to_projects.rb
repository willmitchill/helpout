class AddBioAndVolsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :bio, :string
    add_column :projects, :number_of_vols, :integer
  end
end
