require 'bcrypt'

class User < ActiveRecord::Base
    
    has_many :user_activities
    has_many :activites_owned, :class_name => 'Activity', :foreign_key => 'owner_id'
    has_many :activities, :through => :user_activities
    
    has_many :user_clubs
    has_many :clubs_owned, :class_name => 'Club', :foreign_key => 'owner_id'
    has_many :clubs, :through => :user_clubs
    
    include BCrypt

	def password
		@password ||= Password.new(password_hash)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_hash = @password
	end
	
	def authenticate(attempted_password)
		self.password == attempted_password
	end

end

if User.count == 0
	user = User.new(username: 'admin', email: 'admin@email.com', age: 49)
	user.password = 'admin'        #Brilliant
	user.save
end