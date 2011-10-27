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
      tokens = i.split("(")
      tix_locator = tokens[1] #e.g. "1 tix - SSSAAA"
      # p tokens
      #Name
      name = tokens[0]
      tix_locator_split = tix_locator.split
      #Number of Tickets
      num_tickets = tix_locator_split[0]
      #Locator
      locator = tix_locator_split[3].chomp(")") #To remove last ')'

        p "==Creating Guest=="
        p name
        p num_tickets
        p locator
      
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
