class AddRatedToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :rated, :boolean, :default => false
  end
end
