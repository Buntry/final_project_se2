class CreateActivities < ActiveRecord::Migration
  def up
    create_table :activities do |t|
      
      t.string :name
      t.string :description
      t.string :date
      t.string :time 
      t.float :length
      t.string :location
      
      t.integer :owner_id
      t.integer :club_id
      
      t.timestamps 
    end
  end
  
  def down
    drop_table :activities
  end
end
