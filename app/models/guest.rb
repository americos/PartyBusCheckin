class Guest < ActiveRecord::Base
  attr_accessible :name, :locator, :tickets_bought, :event_date
  
  def self.search(search)
    if search
      @guests = Guest.find(:all, :conditions => [ 'name LIKE ? ', "%#{search}%"])
    else
      @guests = Guest.find(:all)
    end
  end
  
  def self.checkedin(value)
    @guests = Guest.find(:all, :conditions => ['checked_in = ?', value])
  end
  
  #Do logic to parse guest group
  def self.createGuestGroup(group)
    
    arr = group.split(/\n/)

    arr.each do |i|
      #now I have all every record in token
      tokens = i.split
      name = tokens[0] + " " + tokens[1]
      #replace "(" with empty string to get the tickets
      num_tickets = tokens[2].tr_s('(', '')
      #replace ")" for the locator
      locator = tokens[5].tr_s(')', '')
      #p tokens
      p "Creating Guest"
      p name
      p num_tickets
      p locator
      
      Guest.create!(:name => name, :tickets_bought => num_tickets, :locator => locator)
    end
  end
  
end
