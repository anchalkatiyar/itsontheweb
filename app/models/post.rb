class Post < ActiveRecord::Base
  attr_accessible :content, :title,:name,:state,:latitude,:longitude,:gmaps,:population
    
  acts_as_gmappable# :process_geocoding => true
  
  def gmaps4rails_address
    "#{self.name}, #{self.state}"
  end
  
  
  #validates :title , presence: true 
  # validates_presence_of :title, :message=>"Please Enter Title"
end

