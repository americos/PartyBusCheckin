class Guest < ActiveRecord::Base
  attr_accessible :name, :locator, :tickets_bought, :event_date
  
  def self.search(search)
    if search
      @guests = Guest.order(:name).find(:all, :conditions => [ 'name ILIKE ?', "%#{search}%"]) #ILIKE is the Postgres way for case insensitive
    else
      @guests = Guest.order(:name).find(:all)
    end
  end
  
  def self.checkedin(value)
    @guests = Guest.find(:all, :conditions => ['checked_in = ?', value])
  end
  
  #Logic to parse guest group
  def self.createGuestGroup(group, event_date)
    
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
      p event_date
      
      Guest.create!(:name => name, :tickets_bought => num_tickets, :locator => locator, :event_date => event_date)
    end
  end
  
  def self.checkIn(guest, value)
    if value
      guest.checked_in = true 
    else
      guest.checked_in = false
    end 
    guest.save
    
    # respond_to do |format|
    #       format.html { redirect_to guests_url }
    #       format.js
    #     end
  end
  
  
  def self.uncheckall
    @guests = Guest.update_all("checked_in = false")
  end
  
end
