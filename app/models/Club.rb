class Club < ActiveRecord::Base
  
  has_many :activities
  
  has_many :user_clubs
  has_many :users, :through => :user_clubs
  belongs_to :owner, :class_name => 'User'
  
  def parse
    self.keyword_list.split(/[\s,]+/)
  end
  
end