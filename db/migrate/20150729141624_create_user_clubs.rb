class CreateUserClubs < ActiveRecord::Migration
  def up
    create_table :user_clubs do |t|
      t.integer :user_id
      t.integer :club_id
    end
  end
  
  def down
    drop_table :user_clubs
  end
end
