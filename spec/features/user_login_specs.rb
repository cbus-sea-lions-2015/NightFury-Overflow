require 'rails_helper'
require 'capybara/rspec'

feature "User visits page without login in" do
  scenario "when user is not logged in and visits the root page" do
    visit '/'
     expect(page).to have_content("NightFuryOverflow")
  end
end