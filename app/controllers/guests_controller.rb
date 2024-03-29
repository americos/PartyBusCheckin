class GuestsController < ApplicationController
  before_filter :find_guest, :only => [:show, :edit, :update, :destroy, :checkedin, :uncheckedin]
  
  def index
     # @client_ip = request.remote_ip
     #       @remote_ip = request.env["HTTP_X_FORWARDED_FOR"]
     #       @my_ip = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_addr
     #       @ip_addr = request.env['REMOTE_ADDR']
    
    
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
    Guest.checkIn(@guest, true)
    redirect_to guests_url, :notice => "Guest was succussfully checked in!"
  end
  
  def uncheckedin
    Guest.checkIn(@guest, false)
    redirect_to guests_url, :notice => "Guest was succussfully Unchecked in!"
  end
  
  def guestgroup
    @hosts = Host.order(:name).find(:all)
    if params[:guestgroup]
      guestgroup = Guestgroup.new(:type =>params[:type], :date => params[:event_date])
      if guestgroup.save
        Guest.createGuestGroup(params[:guestgroup], params[:event_date], guestgroup.id)
      end
      
      redirect_to guests_url  
    end
  end
  
  def deleteguests
    @Guests = Guest.delete_all
    redirect_to guests_url
  end
  
  def uncheckall
    Guest.uncheckall
    redirect_to guests_url
  end
  
  private 
    def find_guest
      @guest = Guest.find(params[:id])
    end
  
end
