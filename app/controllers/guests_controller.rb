class GuestsController < ApplicationController
  before_filter :find_guest, :only => [:show, :edit, :update, :destroy, :checkedin, :uncheckedin]
  
  
  def index
    @guest = Guest.first
    if params[:checkedin]
      @guests = Guest.checkedin(params[:checkedin].to_bool)
    else
      @guests = Guest.search(params[:search])
    end
  end

  def show
    
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(params[:guest])
    if @guest.save
      redirect_to @guest, :notice => "Successfully created guest."
    else
      render :action => 'new'
    end
  end

  def edit
    
  end

  def update
    if @guest.update_attributes(params[:guest])
      redirect_to guests_url, :notice  => "Successfully updated guest."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @guest.destroy
    redirect_to guests_url, :notice => "Successfully destroyed guest."
  end
  
  def checkedin
    checkIn(true)
    redirect_to guests_url, :notice => "Guest was succussfully checked in!"
  end
  
  def uncheckedin
    checkIn(false)
    redirect_to guests_url, :notice => "Guest was succussfully Unchecked in!"
  end
  
  def guestgroup
    if params[:guestgroup]
      Guest.createGuestGroup(params[:guestgroup], params[:event_date])
      
      redirect_to guests_url  
    end
  end
  
  def deleteguests
    @Guests = Guest.delete_all
    redirect_to guests_url
  end
  
  
  private 
    def find_guest
      @guest = Guest.find(params[:id])
    end
  
    def checkIn(value)
      if value
        @guest.checked_in = true 
      else
        @guest.checked_in = false
      end 
      @guest.save
    end
  
end
