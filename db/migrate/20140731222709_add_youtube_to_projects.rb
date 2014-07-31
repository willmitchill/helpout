class AddYoutubeToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :youtube, :string
  end
end
