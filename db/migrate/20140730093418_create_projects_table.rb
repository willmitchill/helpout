class CreateProjectsTable < ActiveRecord::Migration
  def change
    create_table :projects do |c|
      c.string :name
      c.date :start_date
      c.date :end_date
      c.string :location
      c.timestamps
    end
  end
end
