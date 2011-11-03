require 'spec_helper'

feature "Add Users to Guest List" do
  
  before(:each) do
    @host = FactoryGirl.create(:host)
    visit guestgroup_path
  end
  
  scenario "View the New Guest List page" do
    page.should have_content "Guest Group"
  end

  scenario "User can add Guests to Guest List" do
    fill_in "guestgroup", :with => "Americo Sav (1 tix - AAA)"
    fill_in "event_date", :with => "10/28/2011"
    select "NightBus", :from => "type"
    select @host.name, :from => "host"
    click_button "Add Guests"
    page.should have_content "Americo Sav"
    page.should have_content "10/28/2011"
    Guest.count.should equal(1)
    Guestgroup.count.should equal(1)
  end
  
  scenario "Don't allow empty Guests fields" do
    fill_in "guestgroup", :with => "Americo Sav (1 tix - AAA)"
    fill_in "event_date", :with => ""
      
    total_guests = Guestgroup.count
    click_button "Add Guests"
    Guestgroup.count.should eql(total_guests)    
  end
  
  
  
end