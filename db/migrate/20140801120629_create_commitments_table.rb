class CreateCommitmentsTable < ActiveRecord::Migration
  def change
    create_table :commitments do |c|
      c.integer :user_id
      c.timestamps
    end
  end
end
