class CreateClubs < ActiveRecord::Migration
  def up
    create_table :clubs do |t|
      
      t.string :name
      t.string :description
      t.string :image_url
      t.string :keyword_list
      t.string :contact_info
      
      t.integer :owner_id
      
      t.timestamps
    end
  end
  
  def down
    drop_table :clubs
  end
end
