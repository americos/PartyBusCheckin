require 'spec_helper'

feature 'User views the main page' do
  
  scenario 'successfully views the Guest list' do
    visit root_path
    page.should have_content "PartyBus"
  end
end