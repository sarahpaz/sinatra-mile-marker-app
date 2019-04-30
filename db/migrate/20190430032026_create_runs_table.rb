class CreateRunsTable < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.integer :distance
      t.integer :time 
      t.string :shoes
      t.string :notes
      t.string :indoor_outdoor
      t.integer :user_id
      
      t.timestamps null: false
    end
  end
end