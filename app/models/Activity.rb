class Activity < ActiveRecord::Base
  
  #An activity can only be hosted by a single club.
  belongs_to :club
  
  belongs_to :owner, :class_name => 'User'
  
  has_many :user_activities
  has_many :users, :through => :user_activities
  
end