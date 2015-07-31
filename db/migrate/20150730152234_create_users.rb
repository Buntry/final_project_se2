class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      
      t.string :username
      t.string :email
      t.string :password_hash
      t.string :location
      t.string :profile_picture 
      t.integer :age
      
      t.timestamps
    end
  end
  
  def down
    drop_table :users
  end
  
end
