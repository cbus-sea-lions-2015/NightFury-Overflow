require 'rails_helper'

RSpec.feature "Logins", type: :feature do
  
  before :each do
    visit '/logout'
  end

  scenario "user can see the login form" do
    visit '/'
    click_link('Log In')
    expect(page).to have_content("Log In")
    expect(page).to have_field("session[email]")
    expect(page).to have_field("session[password]")
  end

  scenario "user can login" do
    User.create!(email: "batman@batman.com", password:"batman")
    visit '/'
    click_link('Log In')
    fill_in('session[email]', :with => 'batman@batman.com')
    fill_in('session[password]', :with => 'batman')
    page.find(:css, 'input[type="submit"]').click
    expect(page.current_path).to eq("/profile")
  end

  scenario "user cannot login with bad credentials" do
    User.create!(email: "batman@batman.com", password:"batman")
    visit '/'
    click_link('Log In')
    fill_in('session[email]', :with => 'batman@batman.com')
    fill_in('session[password]', :with => 'batm')
    page.find(:css, 'input[type="submit"]').click
    expect(page.current_path).to eq("/login")
  end


end
