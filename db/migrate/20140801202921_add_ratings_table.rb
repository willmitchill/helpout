class AddRatingsTable < ActiveRecord::Migration
  def change
    create_table :ratings do |r|
      r.integer :user_id
      r.integer :score  
      r.timestamps
    end
  end
end
