class Guest < ActiveRecord::Base
  attr_accessible :name, :locator
  
  def self.search(search)
    if search
      @guests = Guest.find(:all, :conditions => [ 'name LIKE ? ', "%#{search}%"])
    else
      @guests = Guest.find(:all)
    end
    
  end
end
